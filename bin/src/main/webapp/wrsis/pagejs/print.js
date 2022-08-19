
function PrintPageWithOffice(pageheader) {
                var wPageHeader = pageheader;
                var curDate;
               // var fromDate='01-Aug-2016';
               // var ToDate='01-Sep-2016';
               // var office='BSRTC'+','+'BSRTC';
                curDate = new Date();
                curDate = "Date :" + curDate.getDate() + "/" + (curDate.getMonth() + 1) + "/" + curDate.getFullYear();

                var wOption = "width=875,height=525,menubar=yes,scrollbars=yes,location=no,left=20,top=20";
                var wWinHTML = document.getElementById('printArea').innerHTML;
                var wWinPrint = window.open("", "", wOption);
          
                wWinPrint.document.open();
                wWinPrint.document.write("<html><head><link href='styles/Print.css' rel='stylesheet' type='text/css'/><title>Seed Certification & PVP Automation System</title></head><body>");          
                wWinPrint.document.write("<div id='header'><div style='float:left;margin-top:10px;padding-bottom:10px;width:90px;'><img src='wrsis/images/logo.png' alt='Wheat Rust Surveillance Information System' width='60px'/></div><h3 style='float:left; margin-top:25px; margin-left:15px; font-size:21px;'>Wheat Rust Surveillance Information System</h3><div style='float:right' align='right'><div align='right' id='printDate'>"+curDate+"</div></div><div style='clear:both'></div></div>&nbsp;");
                
                wWinPrint.document.write(wWinHTML);
                wWinPrint.document.write("</body></html>");
                wWinPrint.document.close();
                wWinPrint.focus();
                }  



