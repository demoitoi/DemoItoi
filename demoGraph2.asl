/*
 * Demo graph file
 */
Package itoi


System ItoiGraphDemo "ItoiDemo" : Application : Application_Web


DataEntity e_Invoice "Invoice" : Document : Regular [
    attribute ID "Invoice ID" : Integer [constraints (PrimaryKey NotNull Unique)]
    description "Invoices"
]


Actor a_Operator "Operator" : User
Actor a_Manager "Manager" : User




UseCase uc_1_ManageInvoices "Manage Invoices" : EntitiesManage [
    actorInitiates a_Operator
    dataEntity e_Invoice
    actions aCreate, aRead, aUpdate, aDelete
    extensionPoints xp_ConfirmPayment, xp_SendInvoices, xp_PrintInvoice
]


View demoView : UseCaseView [ uc_1_ManageInvoices]