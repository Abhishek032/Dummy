package DemoServs;

import java.util.*;

class KeyClass{
	String id;
	
	 public int hashCode() {
		 return id.hashCode();
	 }
	 
	 public boolean equals(Object anotherObject)  
	 {
		 return id==((KeyClass)anotherObject).id;
	 }
	
}
class ValClass{
	String pw;
}
public class LoginData {
	static String uid[]={"Abhishek","Amar","Ajay","Ashok"};
	static String pas[]={"1234","5678","9012","3456"};
	int index=-1;;
	int l=uid.length;
	HashMap<KeyClass,ValClass> hm=new HashMap<KeyClass,ValClass>();
	public void logData(){
		
		for(int i=0;i<l;i++)
		{
			KeyClass k=new KeyClass();
			k.id=LoginData.uid[i];
			
			ValClass v=new ValClass();
			v.pw=LoginData.pas[i];
			hm.put(k,v);
		}
	}
	public static Boolean Check(String u,String p)
	{
		
		Scanner sc=new Scanner(System.in);
		LoginData ld=new LoginData();
		ld.logData();
		KeyClass key=new KeyClass();
		for(int i=0;i<ld.l;i++)
		{
			if(ld.uid[i].equals(u))
				ld.index=i;
				
		}
		if(ld.index==-1)
		{
			return false;
		}
		else{
			key.id=LoginData.uid[ld.index];
			System.out.println(key.id);
			System.out.println("contains:"+ld.hm.containsKey(key));
			ValClass vl=ld.hm.get(key);
			System.out.println(vl.pw);
			if(vl.pw.equals(p))
			{
				return true;
			}
			else
				return false;
		}
		
	}
}
