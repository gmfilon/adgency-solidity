pragma solidity ^0.4.25;

contract Agreement{

//    uint256 public paymentDay;
    
//    constructor(uint256 _paymentDay) public{
//        paymentDay = _paymentDay;
//    }

// las fechas se trabajan en 
    struct Project{
        // Se define en AgreementFactory es el Id del proyecto
        uint agreementId;
        // Se define en AgreementFactory breve descripcion
        string description; 
        // Se define en AgreementFactory, fecha en que se crea el smartcontract, fechas en timestamp
        uint startDate; 
        // Seteado en toDeliverProject(), fecha en que se entrega el proyecto
        uint deliverDate;
        // Se define en AgreementFactory `maxDaysToDeliver` y la suma de `deliverDate` y  `maxDaysToDeliver` nos da este parámetro (la suma se hace en toDeliverProject() 
        uint deliverLimitDate; 
        // Se define `maxDaysToRejected` en AgreementFactory y la suma de `deliverDate` y  `maxDaysToRejected ` nos da este parámetro (la suma se hace en toDeliverProject()
        uint rejectedLimitDate; 
        // Se define en AgreementFactory el dinero a pagar por el trabajo
        uint amount; 
    }

    struct projectState{
        // Seteado en toDeliverProject()
        bool delivered;
        // Seteado en toDeliverProject()
        bool outOfDate; 
        // Seteado en toDeliverProject()
        bool rejected;
        // Seteado en toDeliverProject()
        bool paid; 
    }

    // Se define en AgreementFactory
    address public recipient; 
    // Se define en AgreementFactory es el wallet donde se blockea el dinero del cliente
    address public blockedAccount; 
       // Se define en AgreementFactory es el wallet del cliente
    address public payer; 


    function toDeliverProject(uint _toDayDate) public {
    // Se comprueba que 'toDayDate' = 'deliverDate' < 'deliverLimitDate'.
    // Cuándo se envía el trabajo al cliente se setéan los valores para: 'deliverDate', 'delivered','deliverLimitDate' y 'rejectedLimitDate'
    }

    function toOutOfDate(uint _toDayDate) public {
	// Por defecto será false, se tiene que llamar a esta función desde otro sitio cuando 
    // 'toDayDate' = 'deliverLimitDate' y comprobar el estado de 'delivered'. Si 'delivered' = false -> outOfDate = true
    }

    function toRejected(uint _toDayDate) public {
    // Por defecto será false, se tiene que llamar a esta función desde otro sitio cuando 
	// 'toDayDate' = 'rejectedLimitDate'. En caso de que lo haya rechazado (esta información nos llega desde un oráculo) -> rejected === true -> se envia a solucionador de conflictos
    }

    function toResolveTheProject(uint _toDayDate) public payable {
    // Se tiene que llamar a esta función desde otro sitio cuando 'toDayDate' = 'rejectedLimitDate'
	// Si `delivered===true`, `outOfDate===false` `rejected===false`, se ejecuta la transacción con valor 'amount' de la cuenta `blockedAccount` a la cuenta `recipient` y se setea `paid===true` 
    // Si `outOfDate===true` se devuelve el dinero a la cuenta del cliente 'payer'
    // Si `rejected===true` se sigue el dinero retenido y se eleva a un solucionador de conflictos
    }

}