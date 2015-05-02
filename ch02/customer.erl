-module(customer).

-record(customer, {name="<anonymous>", address, phone}).

-export([
    get_customer/0,
    get_phone/0,
    get_sandy/0,
    print_contact/1
]).

get_customer() ->
    #customer{}.

get_phone() ->
    #customer{phone="5551212"}.

get_sandy() ->
    #customer{name="Sandy Claws", address="Xmas Town", phone="8675309"}.

% Try the following in erl
% c(customer).
% rr("customer.erl").  % loads the customer record type into erl
% S#customer.name.
% S#customer.address.
% S#customer.phone.

print_contact(#customer{name=Name, address=Addr, phone=Phone})
        when Phone =/= undefined ->
    io:format("Contact: ~s at ~s.~n", [Name, Phone]).
