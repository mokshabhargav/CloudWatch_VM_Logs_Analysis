package logStash;

import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.UnknownHostException;
import java.rmi.RemoteException;

import com.vmware.vim25.InvalidProperty;
import com.vmware.vim25.RuntimeFault;
import com.vmware.vim25.mo.Folder;
import com.vmware.vim25.mo.InventoryNavigator;
import com.vmware.vim25.mo.ManagedEntity;
import com.vmware.vim25.mo.ServiceInstance;
import com.vmware.vim25.mo.VirtualMachine;

public class RetrieveCurrentVM {
        
public static String setVirtualMachineName() throws RemoteException, MalformedURLException, UnknownHostException{
	
	    String vmName = "";
	    
	    ServiceInstance si = new ServiceInstance(new URL("https://130.65.132.102/sdk"), "administrator", "12!@qwQW", true);
        Folder rootFolder = si.getRootFolder();
	
		InetAddress iAddress = InetAddress.getLocalHost();
		String currentIp = iAddress.getHostAddress();
		
		ManagedEntity[] me = new InventoryNavigator(rootFolder).searchManagedEntities("VirtualMachine");
		for (int i = 0; i < me.length; i++) {
			VirtualMachine vm = (VirtualMachine) me[i];
			if(!vm.getConfig().template){
				System.out.println("Guest IP Address " + vm.getGuest().getIpAddress());
			if(vm.getGuest().getIpAddress() != null)
			{
			if(vm.getGuest().getIpAddress().equals(currentIp)){
				vmName = vm.getName();
				System.out.println("Name of the VM : " + vmName);
			}
			}
			else{
				vmName = "test";
			}
			}
		}
		
		return vmName;
}
}
