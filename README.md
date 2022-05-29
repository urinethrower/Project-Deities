# Project-Deities
Algorithmic trading bots - "Deities" Series

# Algorithmic Trading Bot / Expert Advisors: Project Overview
* Developed 3 trading strategies navigating various markets including forex, stock indices, precious metals and Bitcoin (CFDs)
* Backtested over 1000 different indicators and settings, and customised over 20 algorithms from existing indicators
* Strategies including trend-following, confluence trading, grid trading (without Martingale)
* Implemented risk management system virtually to avoid potential stoploss hunting or other broker manipulations
* Advanced features including: hedging, equity curve trading, trade filters, dashboard, etc.
* Created a dynamically linked library (.dll) to handle loop-intensive functions on C++ (e.g. real-time optimisations) and return values to main bot

## Backtesting indicators
'        ' if SL was hit (i.e. treated as SL even if TP was reached on same bar as SL)
        If (EntryPrice - 1.5 * ATR >= MinLow) Then
            
            Do While k <= EndR.Row                       'loop until SL is reached in any bar within the trade
            If (EntryPrice - 1.5 * ATR >= ThisWorkbook.Sheets("input").Cells(k, 5)) Then
                SL_exit_poor_format = ThisWorkbook.Sheets("input").Range("A" & k)
                
                Set SLLookin = Worksheets("signal").UsedRange
                Set SLFound = SLLookin.Find(what:=SL_exit_poor_format, LookIn:=xlValues, LookAt:=xlPart, MatchCase:=False)
                    If Not SLFound Is Nothing Then
                        Set SL_R = SLFound               'record the date (in range format)
                        Exit Do
                    End If
            End If
            k = k + 1
            Loop'

## Track my live performance here!
* [Live account 1](https://www.mql5.com/en/signals/1530022?utm_source=www.twitter.com&utm_campaign=en.signals.sharing.desktop&date=1653775200)
* [Live account 2](https://www.mql5.com/en/signals/1350008?utm_source=www.twitter.com&utm_campaign=en.signals.sharing.desktop&date=1653775200)
* [Demo account 1](https://www.mql5.com/en/signals/1546848?utm_source=www.twitter.com&utm_campaign=en.signals.sharing.desktop&date=1653775200)

## Technical information
**Languages used:** MQL4 (C++ based), C++, Excel (VBA)  
**Development Environment:** MetaEditor 4, Visual Studio (MFC), Excel
