%% Description


%% Testing 
%GenerateRandomLocationString();


%% Function definition


%function to generate random location
function output = GenerateRandomLocationString(void)

    XPos = randn;
    YPos = randn;
    output = strcat(num2str(XPos),",",num2str(YPos));

end
%end of function



%%

