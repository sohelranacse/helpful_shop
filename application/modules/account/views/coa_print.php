<?php
include ('Class/CConManager.php');
include ('Class/Ccommon.php');
include ('Class/CResult.php');
include ('Class/CAccount.php'); 
?>

<div class="row">
    <div class="col-sm-12 col-md-12">
        <div class="panel panel-bd lobidrag">
            <div class="panel-heading">
                <div class="panel-body" >
                    <tr align="center">
                        <td id="ReportName"><b></b></td>
                    </tr>
                    <div class="col-md-12" id="printArea">
                        <!-- <div class="row">
                            <table width="100%">
                                <caption class="text-center">
                                    <table class="print-font-size" width="100%">
                                        <tr>
                                            <td align="left"  width="33.333%">
                                                <img src="<?php echo base_url().$setting->logo;?>"
                                                    class="img-bottom-m print-logo" alt="logo">
                                            </td>
                                            <td align="center"  width="33.333%">
                                                <strong
                                                    class=""><?php echo html_escape($company_info[0]['company_name'])?></strong><br>

                                                <?php echo html_escape($company_info[0]['address']);?>
                                                <br>
                                                <?php echo html_escape($company_info[0]['email']);?>
                                                <br>
                                                <?php echo html_escape($company_info[0]['mobile']);?>
                                            </td>
                                            <td align=" right" width="33.333%">
                                                <date> <?php echo display('date')?>: <?php echo date('d-M-Y'); ?>
                                                </date>
                                                <br>

                                            </td>
                                        </tr>
                                    </table>
                                </caption>
                                <caption class="text-center" style="border-bottom: 1px #c9c9c9 solid;">
                                    <b><?php echo display('bank_reconciliation_report').'  on '.date('d-m-Y', strtotime($dtpFromDate)). ' To '  . date('d-m-Y', strtotime($dtpToDate));?></b>
                                </caption>
                            </table>
                        </div> -->
                        <table width="100%">
                            <caption class="text-center">
                                <table class="print-font-size" width="100%">
                                    <tr>
                                        <td align="left"  width="33.333%">
                                            <img src="<?php echo base_url().$setting->logo;?>"
                                                class="img-bottom-m print-logo" alt="logo">
                                        </td>
                                        <td align="center"  width="33.333%">
                                            <strong
                                                class=""><?php echo html_escape($company_info[0]['company_name'])?></strong><br>

                                            <?php echo html_escape($company_info[0]['address']);?>
                                            <br>
                                            <?php echo html_escape($company_info[0]['email']);?>
                                            <br>
                                            <?php echo html_escape($company_info[0]['mobile']);?>
                                        </td>
                                        <td align=" right" width="33.333%">
                                            <date> <?php echo display('date')?>: <?php echo date('d-M-Y'); ?>
                                            </date>
                                            <br>

                                        </td>
                                    </tr>
                                </table>
                            </caption>
                            <!-- <caption class="text-center" style="border-bottom: 1px #c9c9c9 solid;">
                                <b><?php echo display('bank_reconciliation_report').'  on '.date('d-m-Y', strtotime($dtpFromDate)). ' To '  . date('d-m-Y', strtotime($dtpToDate));?></b>
                            </caption> -->
                        </table>
                        <table cellpadding="3" cellspacing="0" border="1" width="100%">
                            <?php
                            $oResult=new CResult();
                            $oAccount=new CAccount();

                            $sql="SELECT * FROM acc_coa WHERE IsActive=1 ORDER BY HeadCode";
                            $oResult=$oAccount->SqlQuery($sql);
                            for ($i = 0; $i < $oResult->num_rows; $i++)
                            {
                                $sql="SELECT MAX(HeadLevel) as MHL FROM acc_coa WHERE IsActive=1";
                                $oResultLevel=$oAccount->SqlQuery($sql);
                                $maxLevel=$oResultLevel->row['MHL'];

                                $HL=$oResult->rows[$i]['HeadLevel'];
                                $Level=$maxLevel+1;
                                $HL1=$Level-$HL;

                                echo '<tr>';
                                for($j=0; $j<$HL; $j++)
                                
                                echo '<td>'.$oResult->rows[$i]['HeadCode'].'</td>';
                                echo '<td colspan='.$HL1.'>'.$oResult->rows[$i]['HeadName'].'</td>';
                                echo '</tr>';

                            }
                            ?>
                        </table>

                    </div>
                </div>
                <div class="text-center" id="print">
                    <input type="button" class="btn btn-warning" name="btnPrint" id="btnPrint" value="Print"
                    onclick="printDivnew('printArea');" />
                </div>
            </div>
        </div>
    </div>
</div>