Package BillingSystem
 
/********************************************************
   System definition  
*********************************************************/
System Billing_App "BillingSystem (Application Level)" : Application [ isFinal ]

/********************************************************
   DataEntities view
*********************************************************/  
DataEntity e_VAT "Value Added Tax" : Reference [
  attribute Code "Code" : Integer [constraints (PrimaryKey)]
  attribute Name "Name" : String(30)
  attribute Value "Value" : Decimal(2.1) [constraints (NotNull)] 
  description "Value Added Tax"]

DataEntity e_Invoice "Invoice" : Document []


Actor a_Admin "TechnicalAdministrator" : User
Actor a_Manager "Manager" : User [description "Approve Invoices, etc."]
Actor a_Customer "Customer" : User [ description "Receive Invoices to pay"]

/*
 * Requirements: UseCases
 */  
// Customer Actions
ActionType aClose "Close" [description "Close the current Interaction Space (Form, Windows, Dialog, etc.)"]
ActionType aApprove "Approve" [description "Approve Invoice"]
ActionType aReject "Reject" [description "Do not Approve Invoice"]

UseCase uc_1_ManageInvoices "Manage Invoices" : EntitiesManage [
  actorInitiates a_Manager
  dataEntity e_Invoice
  actions aClose 
  extensionPoints xp_Approve]

UseCase uc_2_ApproveInvoice "Approve Invoice" : EntityUpdate [
  actorInitiates a_Manager
  dataEntity e_Invoice
  actions aApprove, aReject, aClose 
  extends uc_1_ManageInvoices onExtensionPoint xp_Approve]


View v_UsecaseDiagram1 : UseCaseView 
[uc_2_ApproveInvoice]

