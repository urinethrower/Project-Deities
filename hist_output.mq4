//+------------------------------------------------------------------+
//|                                                  hist_output.mq4 |
//|                                     Copyright © 2021, DANIEL CKL |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2021, DANIEL CKL"

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start()
  {
  hist_output("USDJPY",PERIOD_D1);

  return(0);
  }

//+------------------------------------------------------------------+
//| output function                                                  |
//+------------------------------------------------------------------+
void hist_output(string ticker, int tf)   //where tf = timeframe
{
  string filename = ticker + "," + tf + ".csv";
  int handle = FileOpen(filename, FILE_CSV|FILE_WRITE, ",");
  if(handle>0)
    {
     FileWrite(handle,"Date,Time,Open,High,Low,Close,Volume,WPR,RSI");  // Adding headers to each column
     for(int i=iBars(ticker,tf)-1; i>=0; i--)   // Using ascending date sequence
       {
       string date1 = TimeToStr(iTime(ticker,tf,i),TIME_DATE);
       date1 = StringSubstr(date1,5,2) + "/" + StringSubstr(date1,8,2) + "/" + StringSubstr(date1,0,4);
       string time1 = TimeToStr(iTime(ticker,tf,i),TIME_MINUTES);
       FileWrite(handle, date1, time1,
                 iOpen(ticker,tf,i),
                 iHigh(ticker,tf,i),
                 iLow(ticker,tf,i),
                 iClose(ticker,tf,i),
                 iVolume(ticker,tf,i),
                 iWPR(ticker,tf,14,i), //William%R indicator, period = 14
                 iRSI(ticker,tf,14,PRICE_CLOSE,i)  //RSI, period = 14, applying on closed price
                 );
       }
     FileClose(handle);
    }
}
