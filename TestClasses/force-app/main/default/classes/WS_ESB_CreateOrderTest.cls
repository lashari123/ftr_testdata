@isTest (SeeAllData=true)

public class WS_ESB_CreateOrderTest {

public static testMethod void createOrder() {
	WS_ESB_CreateOrder.OrderOutputComplexType orn = new WS_ESB_CreateOrder.OrderOutputComplexType();
	WS_ESB_CreateOrder.OrderOutputType orv = new WS_ESB_CreateOrder.OrderOutputType();
	WS_ESB_CreateOrder.customBeanPort wemc = new WS_ESB_CreateOrder.customBeanPort();
	wemc.CreateOrder('1234567890','67890123','ttt');
	WS_ESB_CreateOrder.OrderOutputComplexType res = new WS_ESB_CreateOrder.OrderOutputComplexType();
}
}