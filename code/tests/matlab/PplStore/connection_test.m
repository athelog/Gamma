import matlab.net.*
import matlab.net.http.*
r = RequestMessage;
uri = URI('http://localhost/gamma/engine/dBInterface.php?ActionDBToken=InsertDetectionRecord&Type=boat');
resp = send(r,uri);
status = resp.StatusCode