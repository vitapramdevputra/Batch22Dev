EmployeePurchaseOrder e = new EmployeePurchaseOrder();
e.addOrder();
e.discount();

CustomerPurchaseOrder c = new CustomerPurchaseOrder();
c.addOrder();
c.discount();



iPurchaseOrder emp = new EmployeePurchaseOrder();
iPurchaseOrder cust = new CustomerPurchaseOrder();
iPurchaseOrder partner = new PartnerPurchaseOrder();


emp.discount(); //20%

cust.discount(); //5%

partner.discount();//10%


