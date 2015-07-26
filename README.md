# DS9_Project
Developing Data Products Class Project

A few notes about the project...

1.  Although the project data comes from 
https://www.fbi.gov/about-us/cjis/nics/reports
and http://www.census.gov.  The NICS reports were initially a large
PDF file which had to be then converted to an XLS format and then to a CSV base.  Using https://www.freepdfconvert.com/pdf-excel.  Once the data was in the CSV format (you can view/run **Rproject\_data.R**) it was broken into chunks for each year from 2010 to 2015.  The nics\_master.Rds file was the result. In addition, the Census.gov data for year 2010 to 2015 are projections made by the census agency based on the 2010 census and not actuals.  The nics\_master file is used for the NICS Tracker Presentation but is not used for the **NICS Tracker Shiny APP (censusVIS)** because the data had to be in an extreme format as input.

2.  _Kentucky_ produces a huge outlier for this project, from discussion boards and news notes, it appears they re-check their entire database monthly for anyone who might have(within the month) created a criminal record for themselves and take action to reject purchase privileges on any of those firearm/explosives owners.

3. Without the code to the **censusVIS Shiny APP** it was impossible adjust the input requirements other than formatting (_helpers.R_), User interface (_ui,R_), and file/variable assignments (_server.R_).  The APP was specifically designed for census data in counties across the US, but by trial and error I was able to determine the basic operation and create real and dummy data to make the APP believe it was using census data.  The limitations on this prevented the use of more than 3 years of data because the 4th year had to add up to 100% even though this 4th year is not used in the 
display. 
