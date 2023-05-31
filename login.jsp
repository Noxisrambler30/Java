<%@ page language="java" import="java.io.*,java.lang.*,java.sql.*" %>

<%!
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	int balance,i;
	int total;
	int amt,usid;
	int check;
	int pin,pass;
	int u_id;
	int miniu, minia,data,temp;
	String minit;
%>

<%
String btn5=request.getParameter("btn5");
if(btn5!=null)
{
	out.println("<html><head><title>User Login</title><link rel='stylesheet' href='style.css'></head><body><div class='atmbx'><div class='bximg'><img src='atm.jpg'></img><div class='option'><h3>Thank You For Visiting</h3><div class='sec1'></div><div class='sec2'><a href='display.html'><button type=submit name='btn4' value='with'><font color='white'>Back</button></div></div></div></div></body></html>");
}	
	try
	{
		
		
		
		Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		conn=DriverManager.getConnection("jdbc:ucanaccess://C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/examples/jsp/tanmay/bank.accdb");

		
		pstmt=conn.prepareStatement("select * from details where uid=?");
		usid=Integer.parseInt(request.getParameter("txt2"));
		

		pstmt.setInt(1,usid);
		rs=pstmt.executeQuery();
		
		if(rs.next())
		{
			
			do
			{
				temp=rs.getInt("uid");
				pass=rs.getInt("pin");
				balance=rs.getInt("amount");
				
			}while(rs.next());
		}
		usid=Integer.parseInt(request.getParameter("txt2"));
		pin=Integer.parseInt(request.getParameter("txt3"));
		
		if(temp==usid)
		{ 
			if(temp==usid && pin==pass)
			{
						
							 String btn1=request.getParameter("btn1");
					

							String btn2=request.getParameter("btn2");
					

							String btn3=request.getParameter("btn3");
					

							String btn4=request.getParameter("btn4");

							
					
					
				
						if(btn1!=null)
						{
							
							pstmt=conn.prepareStatement("update details set amount=? where uid=?");
							usid=Integer.parseInt(request.getParameter("txt2"));
							amt=Integer.parseInt(request.getParameter("txt1"));
							

							total=balance+amt;

							pstmt.setInt(1,total);
							pstmt.setInt(2,usid);

							i=pstmt.executeUpdate();
							
							if(i>0)
							{
								out.println("<html><head><title>User Login</title><link rel='stylesheet' href='style.css'></head><body><div class='atmbx'><div class='bximg'><img src='atm.jpg'></img><div class='option'><h3>"+amt+"Deposited</h3><div class='sec1'></div><div class='sec2'><a href='display.html'><button type=submit name='btn4' value='with'><font color='white'>Back</button></div></div></div></div></body></html>");	
							}
							else
							{
								
							}

							pstmt=conn.prepareStatement("insert into debit(uid,pin,amount,type) values (?,?,?,?)");
							usid=Integer.parseInt(request.getParameter("txt2"));
							pin=Integer.parseInt(request.getParameter("txt3"));
							amt=Integer.parseInt(request.getParameter("txt1"));
							String type="Deposit";

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
						}
						else
						{
						
						}
					
						if(btn2!=null)
						{
							amt=Integer.parseInt(request.getParameter("txt1"));
							if(balance>amt)
							{
						
								pstmt=conn.prepareStatement("update details set amount=? where uid=?");
								usid=Integer.parseInt(request.getParameter("txt2"));
								amt=Integer.parseInt(request.getParameter("txt1"));
								total=balance-amt;
	
								pstmt.setInt(1,total);
								pstmt.setInt(2,usid);
	
								i=pstmt.executeUpdate();
								
								if(i>0)
								{
									out.println("<html><head><title>User Login</title><link rel='stylesheet' href='style.css'></head><body><div class='atmbx'><div class='bximg'><img src='atm.jpg'></img><div class='option'><h3>"+amt+"Withdraw</h3><div class='sec1'></div><div class='sec2'><a href='display.html'><button type=submit name='btn4' value='with'><font color='white'>Back</button></div></div></div></div></body></html>");
								}
								else
								{
									
								}
	
								pstmt=conn.prepareStatement("insert into debit(uid,pin,amount,type) values (?,?,?,?)");
								usid=Integer.parseInt(request.getParameter("txt2"));
								pin=Integer.parseInt(request.getParameter("txt3"));
								amt=Integer.parseInt(request.getParameter("txt1"));
								String type="Withdraw";
									
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
							}
							else
							{
								out.println("<html><head><title>User Login</title><link rel='stylesheet' href='style.css'></head><body><div class='atmbx'><div class='bximg'><img src='atm.jpg'></img><div class='option'><h3>Insufficient Balance</h3><div class='sec1'></div><div class='sec2'><a href='display.html'><button type=submit name='btn4' value='with'><font color='white'>Back</button></div></div></div></div></body></html>");									
							}
						}
						else
						{
							
						}

						if(btn3!=null)
						{
							
							pstmt=conn.prepareStatement("select * from debit where uid=? and pin=?");
								usid=Integer.parseInt(request.getParameter("txt2"));
								pin=Integer.parseInt(request.getParameter("txt3"));
								
								pstmt.setInt(1,usid);
								pstmt.setInt(2,pin);
				
								rs=pstmt.executeQuery();
				
								if(rs.next())
								{
									do
									{
											miniu=rs.getInt("uid");
											minia=rs.getInt("amount");
											minit=rs.getString("type");
											out.println("<html><head><title>User Login</title><link rel='stylesheet' href='style.css'></head><body><br><table border='5' cellspacing='0'><tr><td>USERID</td><td>AMOUNT</td><td>TYPE</td></tr><tr><td>"+miniu+"</td><td>"+minia+"</td><td>"+minit+"</td></tr></table></body></html>");	
									}while(rs.next());
									
								}
								else
								{
									
								}
						}
						else	
						{
							
						}
				
						if(btn4!=null)
						{
							amt=Integer.parseInt(request.getParameter("txt1"));
							session.setAttribute("money",amt);

							usid=Integer.parseInt(request.getParameter("txt2"));
							session.setAttribute("user",usid);

							pin=Integer.parseInt(request.getParameter("txt3"));
							session.setAttribute("password",pin);

							
							amt=Integer.parseInt(request.getParameter("txt1"));
							
							out.println("<html><head><title>www.indirabank.com</title><link rel='stylesheet' href='style.css'></head><body><div class='atm'><img src='atm.jpg'></img><div class='details'><form action='btn5.jsp' method = 'post'><div class='put'><input type='text' placeholder='UserId' name='txt5' pattern='[0-9]*' title='Enter Number'></div><div class='put2'><div class='btn3'><button type='sumbit' name='btn5' value='send'>Transfer</button></div></div></form></div></div></body></html>");
		
							
						}
						else
						{
							
						}	
			}
			else
			{
				out.println("<html><head><title>User Login</title><link rel='stylesheet' href='style.css'></head><body><div class='atmbx'><div class='bximg'><img src='atm.jpg'></img><div class='option'><h3>Invalid UserId or Password</h3><div class='sec1'></div><div class='sec2'><a href='display.html'><button type=submit name='btn4' value='with'><font color='white'>Back</button></div></div></div></div></body></html>");
			}
		}
		else
		{
			pstmt=conn.prepareStatement("select * from details");
			rs=pstmt.executeQuery();
		
			if(rs.next())
			{
			
				do
				{
					temp=rs.getInt("uid");
					
				}while(rs.next());
			}
			usid=Integer.parseInt(request.getParameter("txt2"));
			
			if(usid!=temp)
			{
					pstmt=conn.prepareStatement("insert into details(uid,pin) values(?,?)");
					usid=Integer.parseInt(request.getParameter("txt2"));
					pin=Integer.parseInt(request.getParameter("txt3"));
		
					pstmt.setInt(1,usid);
					pstmt.setInt(2,pin);
					i=pstmt.executeUpdate();

					if(i>0)
					{
						
					}
					else
					{
						
					}
															
				
					
					
						pstmt=conn.prepareStatement("select * from details where uid=?");
						usid=Integer.parseInt(request.getParameter("txt2"));
		
						pstmt.setInt(1,usid);
						rs=pstmt.executeQuery();
				

						if(rs.next())
						{
							check=rs.getInt("uid");
							pass=rs.getInt("pin");
							balance=rs.getInt("amount");
							
						}
						usid=Integer.parseInt(request.getParameter("txt2"));
						pin=Integer.parseInt(request.getParameter("txt3"));
		
						if(usid==check && pin==pass)
						{
		

							String btn1=request.getParameter("btn1");
							
								
							String btn2=request.getParameter("btn2");
							

							String btn3=request.getParameter("btn3");
							

							String btn4=request.getParameter("btn4");
							
							
				
							if(btn1!=null)
							{
								
								pstmt=conn.prepareStatement("update details set amount=? where uid=?");
								usid=Integer.parseInt(request.getParameter("txt2"));
								amt=Integer.parseInt(request.getParameter("txt1"));
								total=balance+amt;

								pstmt.setInt(1,total);
								pstmt.setInt(2,usid);
	
								i=pstmt.executeUpdate();
							
								if(i>0)
								{		
									out.println("<html><head><title>User Login</title><link rel='stylesheet' href='style.css'></head><body><div class='atmbx'><div class='bximg'><img src='atm.jpg'></img><div class='option'><h3>"+amt+"Deposited</h3><div class='sec1'></div><div class='sec2'><a href='display.html'><button type=submit name='btn4' value='with'><font color='white'>Back</button></div></div></div></div></body></html>");	
								}
								else
								{
									
								}

								pstmt=conn.prepareStatement("insert into debit(uid,pin,amount,type) values (?,?,?,?)");
								usid=Integer.parseInt(request.getParameter("txt2"));
								pin=Integer.parseInt(request.getParameter("txt3"));
								amt=Integer.parseInt(request.getParameter("txt1"));
								String type="Deposit";

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
							}
							else
							{
								
							}
							
							if(btn2!=null)
							{
								amt=Integer.parseInt(request.getParameter("txt1"));
								if(balance>amt)
								{
						
									pstmt=conn.prepareStatement("update details set amount=? where uid=?");
									usid=Integer.parseInt(request.getParameter("txt2"));
									amt=Integer.parseInt(request.getParameter("txt1"));
									total=balance-amt;
	
									pstmt.setInt(1,total);
									pstmt.setInt(2,usid);
	
									i=pstmt.executeUpdate();
								
									if(i>0)
									{
										out.println("<html><head><title>User Login</title><link rel='stylesheet' href='style.css'></head><body><div class='atmbx'><div class='bximg'><img src='atm.jpg'></img><div class='option'><h3>"+amt+"Withdraw</h3><div class='sec1'></div><div class='sec2'><a href='display.html'><button type=submit name='btn4' value='with'><font color='white'>Back</button></div></div></div></div></body></html>");
									}
									else
									{
									
									}
	
									pstmt=conn.prepareStatement("insert into debit(uid,pin,amount,type) values (?,?,?,?)");
									usid=Integer.parseInt(request.getParameter("txt2"));
									pin=Integer.parseInt(request.getParameter("txt3"));
									amt=Integer.parseInt(request.getParameter("txt1"));
									String type="Withdraw";
									
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
								}
								else
								{
									out.println("<html><head><title>User Login</title><link rel='stylesheet' href='style.css'></head><body><div class='atmbx'><div class='bximg'><img src='atm.jpg'></img><div class='option'><h3>Insufficient Balance</h3><div class='sec1'></div><div class='sec2'><a href='display.html'><button type=submit name='btn4' value='with'><font color='white'>Back</button></div></div></div></div></body></html>");									
								}									
							}
							else
							{
								
							}
		
							if(btn3!=null)
							{
								
								pstmt=conn.prepareStatement("select * from debit where uid=? and pin=?");
								usid=Integer.parseInt(request.getParameter("txt2"));
								pin=Integer.parseInt(request.getParameter("txt3"));
								
								pstmt.setInt(1,usid);
								pstmt.setInt(2,pin);
				
								rs=pstmt.executeQuery();
				
								if(rs.next())
								{
									do
									{
											miniu=rs.getInt("uid");
											minia=rs.getInt("amount");
											minit=rs.getString("type");
											out.println("<html><head><title>User Login</title><link rel='stylesheet' href='style.css'></head><body><br><table border='5' cellspacing='0'><tr><td>USERID</td><td>AMOUNT</td><td>TYPE</td></tr><tr><td>"+miniu+"</td><td>"+minia+"</td><td>"+minit+"</td></tr></table></body></html>");	
									}while(rs.next());
									
								}
								else
								{
									
								}
							}
							else	
							{
								
							}
					
							if(btn4!=null)
							{
								
								
								usid=Integer.parseInt(request.getParameter("txt2"));
								out.println("<h2>ID is</h2>"+usid);
								amt=Integer.parseInt(request.getParameter("txt1"));
								total=balance+amt;
								
								out.println("<html><head><title>User Login</title><link rel='stylesheet' href='style.css'></head><body><div class='atmbx'><div class='bximg'><img src='atm.jpg'></img><div class='option'><h3>Invalid UserId or Password</h3><div class='sec1'><input type='text' placeholder='Enter amount' name='txt4'></input></div><div class='sec3'><a href='display.html'><form method='post' action='login.jsp'><button type=submit name='btn6' value='transfer'><font color='white'>Transfer</button><a href='display.html'><button type=submit name='btn4' value='with'><font color='white'>Back</button></form></div></div></div></div></body></html>");

								int amt2=Integer.parseInt(request.getParameter("txt4"));
								out.println("<h2>Anount 2</h2>"+amt2);
								
							}
							else
							{
								
							}

							
						}
						else
						{
							out.println("<html><head><title>User Login</title><link rel='stylesheet' href='style.css'></head><body><div class='atmbx'><div class='bximg'><img src='atm.jpg'></img><div class='option'><h3>Invalid UserId or Password</h3><div class='sec1'></div><div class='sec2'><a href='display.html'><button type=submit name='btn4' value='with'><font color='white'>Back</button></div></div></div></div></body></html>");
						}
			}
			else
			{
					out.println("<h2>HERE IT IS</h2>");
			}
		}
				
	}
	catch(Exception e)
	{
		
	}
	
	
%>