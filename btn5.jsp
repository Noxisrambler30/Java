<%@ page language="java" import="java.io.*,java.lang.*,java.sql.*" %>

<%!
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	int balance,i;
	int total;
	int usid1;
	int balance1;
	int pin,pin1;
	int temp;
	
%>

<%

	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
	conn=DriverManager.getConnection("jdbc:ucanaccess://C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/examples/jsp/tanmay/bank.accdb");

	
		/* reciever */
			pstmt=conn.prepareStatement("select * from details");
			rs=pstmt.executeQuery();

			if(rs.next())
			{
				do
				{
					temp=rs.getInt("uid");
				}while(rs.next());
			}
			usid1=Integer.parseInt(request.getParameter("txt5"));
		
			if(temp==usid1)
			{
					pstmt=conn.prepareStatement("select * from details where uid=?");
					int usid=(int)session.getAttribute("user");
	
					pstmt.setInt(1,usid);
					rs=pstmt.executeQuery();
		
					if(rs.next())
					{
					do
					{
						balance=rs.getInt("amount");	
						}while(rs.next());
					}


					int amt=(int)session.getAttribute("money");
					int pin=(int)session.getAttribute("password");
				

					if(balance>amt)
					{
						
						pstmt=conn.prepareStatement("update details set amount=? where uid=?");
						amt=(int)session.getAttribute("money");
						usid=(int)session.getAttribute("user");
		
						total=balance-amt;
	
						pstmt.setInt(1,total);
						pstmt.setInt(2,usid);
	
						i=pstmt.executeUpdate();
								
						if(i>0)
						{
									
						}
						else
						{
									
						}
	
						pstmt=conn.prepareStatement("insert into debit(uid,pin,amount,type) values (?,?,?,?)");
						usid=(int)session.getAttribute("user");
						pin=(int)session.getAttribute("password");
						amt=(int)session.getAttribute("money");
						String type="Sent";
										
						pstmt.setInt(1,usid);
						pstmt.setInt(2,pin);
						pstmt.setInt(3,amt);
						pstmt.setString(4,type);
	
						i=pstmt.executeUpdate();
		
						if(i>0)
						{
						
						}
						else
						{
					
						}
					
						 amt=(int)session.getAttribute("money");
						usid1=Integer.parseInt(request.getParameter("txt5"));
		
						pstmt=conn.prepareStatement("select * from details where uid=?");
						usid1=Integer.parseInt(request.getParameter("txt5"));
						pstmt.setInt(1,usid1);
						rs=pstmt.executeQuery();
		
						if(rs.next())
						{
							do
							{
								balance1=rs.getInt("amount");
								pin1=rs.getInt("pin");
							
							}while(rs.next());
						}
				
					
				
							pstmt=conn.prepareStatement("update details set amount=? where uid=?");
							usid1=Integer.parseInt(request.getParameter("txt5"));
							amt=(int)session.getAttribute("money");
							total=balance1+amt;
						
							pstmt.setInt(1,total);
							pstmt.setInt(2,usid1);
						
							i=pstmt.executeUpdate();
											
							if(i>0)
							{		
									out.println("<html><head><title>User Login</title><link rel='stylesheet' href='style.css'></head><body><div class='atmbx'><div class='bximg'><img src='image/atm.jpg'><div class='option'><h3>"+amt+"Transferred</h3><div class='sec1'></div><div class='sec2'><a href='display.html'><button type=submit name='btn4' value='with'><font color='white'>Back</button></div></div></div></div></body></html>");	
							}
							else
							{
									
							}
							pstmt=conn.prepareStatement("insert into debit(uid,pin,amount,type) values (?,?,?,?)");
							
							usid1=Integer.parseInt(request.getParameter("txt5"));
							amt=(int)session.getAttribute("money");
							String type1="Recieved";
						
							pstmt.setInt(1,usid1);
							pstmt.setInt(2,pin1);
							pstmt.setInt(3,amt);
							pstmt.setString(4,type1);
							
							i=pstmt.executeUpdate();
				
							if(i>0)
							{
								
							}
							else
							{		
							
							}
					
					}
					else
					{
						out.println("<html><head><title>User Login</title><link rel='stylesheet' href='style.css'></head><body><div class='atmbx'><div class='bximg'><img src='image/atm.jpg'><div class='option'><h3>Insufficient Balance</h3><div class='sec1'></div><div class='sec2'><a href='display.html'><button type=submit name='btn4' value='with'><font color='white'>Back</button></div></div></div></div></body></html>");									
					}
			}
			else
			{	
				out.println("<html><head><title>User Login</title><link rel='stylesheet' href='style.css'></head><body><div class='atmbx'><div class='bximg'><img src='image/atm.jpg'><div class='option'><h3>Invalid UserId</h3><div class='sec1'></div><div class='sec2'><a href='display.html'><button type=submit name='btn4' value='with'><font color='white'>Back</button></div></div></div></div></body></html>");	
			}
	
%>