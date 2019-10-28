# Simple DSL example file
[keyword]avoid looping=no-loop true
[when]There is an Event=$c:Event()
[when]- with type {type:\w*} = type == Event.Type.{type}
[when]- with registrationNumber set = registrationNumber != null
[when]- with identificationNumber set = identificationNumber != null
[when]- with identificationNumber {identificationNumber:\w*} = identificationNumner == {identificationNumber}
[when]- with identificationNumber {registrationNumber:\w*} = registrationNumber == {registrationNumber}
[then]Enrich with Vehicle data = EventToBeEnrichWithVehicle ewVehicle = don($c, EventToBeEnrichWithVehicle.class);
[then]Enrich with Driver data = EventToBeEnrichWithDriver ewDriver = don($c, EventToBeEnrichWithDriver.class);
[then]Filter event = EventToBeEnrichWithDriver ewDriver = don($c, EventToBeEnrichWithDriver.class);


rule "Filter REQUEST_DRIVER_ITV_COMPLIANCE event"
avoid looping
when
    There is an Event
        - with type REQUEST_DRIVER_ITV_COMPLIANCE
        - with identificationNumber set
then
    Filter event
end