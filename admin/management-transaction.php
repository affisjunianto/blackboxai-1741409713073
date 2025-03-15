<section class="content">
    <div class="row">
        
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Management Transaction</h3>                                    
                </div><!-- /.box-header -->

                <div class="box-body table-responsive">
                    
                    <table id="table-management-transaction" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Trx ID</th>
                                <th>To Agent</th>
                                <th>From Agent</th>
                                <th>Action</th>
                                <th>Amount</th>
                                <th>Before Parent Balance</th>
                                <th>After Parent Balance</th>
                                <th>Type Transaction</th>
                                <th>Created</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if($data_admin['agent_level'] == "agent"){
                                $cek_perpanjang = mysqli_query($call, "SELECT * FROM tb_transfer WHERE from_agent = '".$data_admin['agent_code']."'");
                            } else if($data_admin['agent_level'] == "admin"){
                                $cek_perpanjang = mysqli_query($call, "SELECT * FROM tb_transfer");
                            }
                            while ($data_perpanjang = mysqli_fetch_array($cek_perpanjang)) {
                            ?>
                            <tr>
                                <td><?= $data_perpanjang['trxid']?></td>
                                <td><?= $data_perpanjang['to_agent']?></td>
                                <td><?= $data_perpanjang['from_agent']?></td>
                                <td style="color: green"><?= strtoupper($data_perpanjang['action'])?></td>
                                <td style="color: green"><?= number_format($data_perpanjang['amount'],0,',','.')?></td>
                                <td style="color: green"><?= number_format($data_perpanjang['before_agent_balance'],0,',','.')?></td>
                                <td style="color: green"><?= number_format($data_perpanjang['after_agent_balance'],0,',','.')?></td>
                                <td><?= $data_perpanjang['note']?></td>
                                <td><?= $data_perpanjang['created']?></td>
                            </tr>

                            <?php
                            }
                            ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Trx ID</th>
                                <th>To Agent</th>
                                <th>From Agent</th>
                                <th>Action</th>
                                <th>Amount</th>
                                <th>Before Balance</th>
                                <th>After Balance</th>
                                <th>Type Transaction</th>
                                <th>Created</th>
                            </tr>
                        </tfoot>
                    </table>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>
</section><!-- /.content -->