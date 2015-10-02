module datadogd;

import std.conv;
import std.net.curl;
import std.string;



class ddog
{
  private string api_key ;
  private string app_key ;
  string queryStartDate;
  string queryEndDate;

  this(string api, string app, string start, string end){
    writeln("Making a dog...");
    api_key = api;
    app_key = app;
    queryStartDate = start;
    queryEndDate = end;
  };
  
  string address = "https://app.datadoghq.com/api/v1/query";
  
  string get_response(){
    string url = address ~ "?"
      ~ "api_key=" ~ api_key ~ "&" 
      ~ "application_key=" ~ app_key ~ "&" 
      ~ "from=" ~ queryStartDate ~ "&" 
      ~ "to=" ~ queryEndDate ~ "&" 
      ~ "query=" ~ "system.cpu.user{customer:selerity}";
      
    auto response = get(url);
    return to!string(response);
  }
}
