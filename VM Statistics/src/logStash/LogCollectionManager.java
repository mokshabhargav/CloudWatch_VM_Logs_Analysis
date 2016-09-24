package logStash;

public class LogCollectionManager {
	
public static void main(String[] args) {
		try{

			//String vm = RetrieveCurrentVM.setVirtualMachineName();
			Runnable task= new VMPerfThread("Test4");
			Thread t=new Thread(task);
			t.start();			
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally{
			System.out.println("in finally");
			}
		}
}



