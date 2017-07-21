import matlab.net.*
import matlab.net.http.*

%{
r = RequestMessage;
uri = URI('http://localhost/gamma/engine/dBInterface.php?ActionDBToken=InsertDetectionRecord&Type=plane');
resp = send(r,uri);
status = resp.StatusCode
%}

%function to Send HTTP info
function output = HTTP_Send(url_string)

    r = RequestMessage;
    uri = URI(url_string);
    resp = send(r,uri);
    output = resp.StatusCode

end
%end of function