function startMarginMenu(marginTitle) {

document.writeln("    <!-- Margin menu is 22% of page width -->");
document.writeln("    <td width='22%' valign='top'>");
document.writeln("	   <table border='0' width='100%'>");
document.writeln("        <tr>");
document.writeln("          <td width='100%'>");
document.writeln("		      <table border='0' cellpadding='2' cellspacing='0' width='100%'>");
document.writeln("              <tr>");
document.writeln("                <td width='100%'>");
document.writeln("                  <table border='0' cellspacing='0' width='100%' cellpadding='0'>");
document.writeln("                    <tr>");
document.writeln("					       <td class='menutitle'>&nbsp;</td>");
document.writeln("                      <td class='menutitle'>merginTitle</td>");
document.writeln("                    </tr>");
}

function endMarginMenu() {

document.writeln("				      </table>");
document.writeln("				    </td>");
document.writeln("              </tr>");
document.writeln("            </table>");
document.writeln("          </td>");
document.writeln("        </tr>");
document.writeln("        <tr>");
document.writeln("          <td height='40'></td>");
document.writeln("        </tr>");
document.writeln("      </table>");
document.writeln("	 </td>");
}

function selectedMarginMenuItem(itemHref, itemText) {
 
document.writeln("                       <tr>");
document.writeln("					       <td>&nbsp;</td>");
document.writeln("                      <td height='25'>");
document.writeln("					         <a class='menuselected'> <!--href='"+itemHref+"'-->");
document.writeln("					         <img src='rightarrow.gif' border='0' height='12' width='12'>");
document.writeln("					         "+itemText);
document.writeln("					         </a>");
document.writeln("					       </td>");
document.writeln("                    </tr>");
}

function marginMenuItem(itemHref, itemText) {
 
document.writeln("                    <tr>");
document.writeln("					       <td>&nbsp;</td>");
document.writeln("                      <td height='25'>");
document.writeln("					         <a class='menutext' href='"+itemHref+"'>");
document.writeln("   					      <img src='rightarrow.gif' border='0' height='12' width='12'>");
document.writeln("					         "+itemText);
document.writeln("						      </a>");
document.writeln("					       </td>");
document.writeln("                    </tr>");
}
