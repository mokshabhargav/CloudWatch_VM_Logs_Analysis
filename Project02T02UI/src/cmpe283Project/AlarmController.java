package cmpe283Project;


import java.net.MalformedURLException;
import java.net.UnknownHostException;
import java.rmi.RemoteException;

import org.json.simple.parser.ParseException;


public class AlarmController extends Thread{

	    //public static void main(String[] args) throws RemoteException, MalformedURLException, UnknownHostException, ParseException {
  		
		String vm = "Test4";
		int cpuTreshold = 30;
		int memTreshold = 70;
		int treshold = 60;
		String selectedTreshold = "cpu";
		Boolean rangeExceeded = false;
		String msg = "Memory/CPU usage exceeded beyond limit";
		
		
		
        public AlarmController(String vm, String metric, int treshold) {
			this.vm = vm;
			selectedTreshold = metric;
			this.treshold = treshold;
			
		}



		public void run() {
    	 
		try {
		while (true) {
		
		//SendMail m = new SendMail();

		if(selectedTreshold.equals("cpu"))
		{
			rangeExceeded = CPUUsageMonitor.checkCPUUsage(vm, treshold);
			msg = "CPU usage exceeded beyond limit";
		}
		
		if(selectedTreshold.equals("mem"))
		{
		    rangeExceeded = MemoryUsageMonitor.memoryMonitor(vm, treshold);
		    msg = "Memory usage exceeded beyond limit";
		}
		
		if(rangeExceeded)
		   {
			System.out.println("Generating Alarm");
			SendMail.sendMail(msg, vm);
		   }	

		    Thread.sleep(2500);
	      }
		
		
	   }
		catch (Exception e) {
		   e.printStackTrace();

		}	
	}

}
