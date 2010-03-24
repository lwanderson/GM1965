class User < ActiveRecord::Base

  CONSONANTS = ['w', 'r', 't', 'y', 'p', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'z', 'c', 'v', 'b', 'n', 'm']
  VOWELS = ['e', 'u', 'i', 'o', 'a']
  PUNCTUATION = ['~', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '-', '+', '=', ':', ';']
  LENGTH = 12

  cattr_accessor :current_user

  validates_presence_of :username
  validates_length_of :username, :maximum => 255
  validates_presence_of :password
  validates_length_of :password, :maximum => 255

  before_save :encrypt_password

  def to_xml_element(parent, name)
    user_xml = parent.add_element(name)
    user_xml.add_element('username').text = self.username
    user_xml.add_element('password').text = self.password
    user_xml
  end

  def disable
    self.enabled = false
  end

  def disable!
    disable
    save!
  end

  def enable
    self.enabled = true
  end

  def enable!
    enable
    save!
  end

  def reset_password(send_email = false)
    new_pass = generate_random_password
    self.password = new_pass
    if send_email
      UserMailer.deliver_password_change_message(self, new_pass)
    end
    new_pass
  end

  def reset_password!(send_email = false)
    new_password = reset_password(send_email)
    save!
    new_password
  end

  def password_without_encryption=(p)
    password_dirty = false
    write_attribute(:password, p)
  end

  def enabled?
    self.enabled
  end

  def self.authenticate(username, password = nil)
    if username.is_a?(Hash)
      password = username[:password]
      username = username[:username]
    end
    user = nil
    users = User.find(:all, :conditions => ['username = ? and password = ? and enabled = true', username, password])
    user = users.first unless users.empty?
    user
  end

  def self.hash_password(username, password)
    Digest::SHA1.hexdigest(username + ':www.scientificvoice.com:' + password)
  end

  private
  def generate_word(len)
    word = ''
    0.upto(len) do |i|
      source = i % 2 == 0 ? VOWELS : CONSONANTS
      char = source[rand(source.length)]
      upcase = rand(3) == 0 ? true : false
      char = char.upcase if upcase
      word << char
    end
    word
  end

  def generate_random_password
    number = rand(9).to_s + rand(9).to_s
    first_word_len = rand(4) + 1
    second_word_len = LENGTH - first_word_len - 3
    punc = PUNCTUATION[rand(PUNCTUATION.length)]
    pass = generate_word(first_word_len) + punc + number + generate_word(second_word_len)
    pass
  end

  def encrypt_password
    if self.password.length < 40
      write_attribute(:password, Digest::SHA1.hexdigest((self.username || '') + ':gmclasof65.org:' + self.password))
    end
  end
end
