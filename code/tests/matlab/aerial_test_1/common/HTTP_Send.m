%% Description


%% Testing 

%HTTP_Send('http://localhost/gamma/engine/dBInterface.php?ActionDBToken=InsertDetectionRecord&Type=chopper');


%% Function definition


%function to Send HTTP info
function output = HTTP_Send(url_string)

    import matlab.net.*
    import matlab.net.http.*

    r = RequestMessage;
    uri = URI(url_string);
    resp = send(r,uri);
    output = resp.StatusCode

end
%end of function

%%

