# Project-Deities
Algorithmic trading bots - "Deities" Series

# Algorithmic Trading Bot / Expert Advisors: Project Overview
* Developed 3 trading strategies navigating various markets including forex, stock indices, precious metals and Bitcoin (CFDs)
* Backtested over 1000 single-criteria trading systems, and customised over 20 algorithms from existing indicators
* Strategies including trend-following, confluence trading, grid trading (without Martingale)
* Implemented risk management system virtually to avoid potential stoploss hunting or other broker manipulations
* Advanced features including: hedging, equity curve trading, trade filters, dashboard, etc.
* Created a dynamically linked library (.dll) to handle loop-intensive functions on C++ (e.g. real-time optimisations) and return values to main bot

## Data collection
Collecting time-series data on MetaTrader 4 is relatively convenient, using the native FileWrite function, data downloaded from MetaQuotes can be exported to a csv file. The function looks something like the following:
```
void hist_output(string ticker, int tf)                           //where tf = timeframe
{
  string filename = ticker + "," + tf + ".csv";
  int handle = FileOpen(filename, FILE_CSV|FILE_WRITE, ",");
  if(handle>0)
    {
     FileWrite(handle,"Date,Time,Open,High,Low,Close,Volume");   // Adding headers to each column
     for(int i=iBars(ticker,tf)-1; i>=0; i--)                    // Using ascending date sequence
       {
       string date1 = TimeToStr(iTime(ticker,tf,i),TIME_DATE);
       date1 = StringSubstr(date1,5,2) + "/" + StringSubstr(date1,8,2) + "/" + StringSubstr(date1,0,4);
       string time1 = TimeToStr(iTime(ticker,tf,i),TIME_MINUTES);
       FileWrite(handle, date1, time1, iOpen(ticker,tf,i), iHigh(ticker,tf,i), iLow(ticker,tf,i), iClose(ticker,tf,i), iVolume(ticker,tf,i));
       }
     FileClose(handle);
    }
}
```
Data collected using this method can only be accurate up to 1-Minute bars, for which I have decided to sacrifice some accuracy for increased testing speed.

## Backtesting single criteria trading systems

```
' if SL was hit
If (EntryPrice - ATR_x * ATR >= MinLow) Then

Do While k <= EndR.Row                       'loop until SL is reached in any bar within the trade
If (EntryPrice - ATR_x * ATR >= ThisWorkbook.Sheets("input").Cells(k, 5)) Then
    SL_exit_poor_format = ThisWorkbook.Sheets("input").Range("A" & k)

    Set SLLookin = Worksheets("signal").UsedRange
    Set SLFound = SLLookin.Find(what:=SL_exit_poor_format, LookIn:=xlValues, LookAt:=xlPart, MatchCase:=False)
        If Not SLFound Is Nothing Then
            Set SL_Range = SLFound           'record the date
            Exit Do
        End If
End If
k = k + 1
Loop
``` 

## Track my live performance here!
* [Live account 1](https://www.mql5.com/en/signals/1530022?utm_source=www.twitter.com&utm_campaign=en.signals.sharing.desktop&date=1653775200)
* [Live account 2](https://www.mql5.com/en/signals/1350008?utm_source=www.twitter.com&utm_campaign=en.signals.sharing.desktop&date=1653775200)
* [Demo account 1](https://www.mql5.com/en/signals/1546848?utm_source=www.twitter.com&utm_campaign=en.signals.sharing.desktop&date=1653775200)

## Technical information
**Languages used:** MQL4 (C++ based), C++, Excel (VBA)  
**Development Environment:** MetaEditor 4, Visual Studio (MFC), Excel
