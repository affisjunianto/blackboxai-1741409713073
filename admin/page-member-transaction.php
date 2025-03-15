<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Member Transaction</h3>                                    
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="table-member-betting" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>User Site</th>
                                <th>User API</th>
                                <th>Amount</th>
                                <th>Before Agent Balance</th>
                                <th>After Agent Balance</th>
                                <th>Type</th>
                                <th>Date Bet</th>
                                <th>Agent Code</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if($data_admin['agent_level'] == "agent"){
                                $cek_game = mysqli_query($call, "SELECT * FROM tb_transaction WHERE agent_code = '".$data_admin['agent_code']."'");
                            } else {
                                $cek_game = mysqli_query($call, "SELECT * FROM tb_transaction");
                            }
                            while($data_betting = mysqli_fetch_array($cek_game)){
                            ?>
                            <tr>
                                <td><?= $data_betting['extUser']?></td>
                                <td><?= $data_betting['intUser']?></td>
                                <td><?= number_format($data_betting['amount'],0,',','.')?></td>
                                <td><?= number_format($data_betting['before_agent_balance'],0,',','.')?></td>
                                <td><?= number_format($data_betting['after_agent_balance'],0,',','.')?></td>
                                <td><?= strtoupper($data_betting['type'])?></td>
                                <td><?= $data_betting['created']?></td>
                                <td><?= $data_betting['agent_code']?></td>
                            </tr>
                            <?php
                            }
                            ?>
                            
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>User Site</th>
                                <th>User API</th>
                                <th>Amount</th>
                                <th>Before Agent Balance</th>
                                <th>After Agent Balance</th>
                                <th>Type</th>
                                <th>Date Bet</th>
                                <th>Agent Code</th>
                            </tr>
                        </tfoot>
                    </table>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>

    </div>
</section><!-- /.content -->