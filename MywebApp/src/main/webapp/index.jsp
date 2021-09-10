<%!
  String[] colors = {"Green", "yellow", "Black", "Red", "pink"};
%>
<HTML>
  <HEAD><TITLE>Setting Colors Code</TITLE></HEAD>
  <BODY>
    <H1>List of colors</H1>
    <TABLE BORDER="1" align="center" bgcolor="#E8FDFF"
     weight="50%" height="40%">
      <TH>Color Name:</TH>
      <% for (int i=0; i<colors.length; i++) { %>
        <TR><TD bgcolor="<%=colors[i] %>">
     <font color="white"><%= colors[i]%></font></TD></TR>
      <% } %>
    </TABLE>
  </BODY>
</HTML>
