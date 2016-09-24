package cmpe283Project;

public class AlarmThread {
	
	//public static void main(String[] args) {
	public static void generateAlarm(String vm, String metric, String Treshold)
	{
		try{

			int treshold_value = Integer.parseInt(Treshold);
			AlarmController al= new AlarmController(vm, metric, treshold_value);
			//Thread t=new Thread(task);
			al.start();			
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally{
			//System.out.println("in finally");
			}
		}

}
