<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Member Betting</h3>                                    
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="table-member-betting" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>User Site</th>
                                <th>User API</th>
                                <th>Bet Money</th>
                                <th>Win Money</th>
                                <th>Game Name</th>
                                <th>Date Bet</th>
                                <th>Session Game</th>
                                <th>Matrix Betting</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            while($data_betting = mysqli_fetch_array($cek_betting)){
                                $cek_game = mysqli_query($call, "SELECT * FROM tb_game WHERE game_code = '".$data_betting['game_code']."'");
                                $data_game = mysqli_fetch_array($cek_game);
                            ?>
                            <tr>
                                <td><?= $data_betting['extUser']?></td>
                                <td>NULL</td>
                                <td><?= number_format($data_betting['bet_money'],0,',','.')?></td>
                                <td><?= number_format($data_betting['win_money'],0,',','.')?></td>
                                <td><?= $data_game['game_name']?></td>
                                <td><?= $data_betting['created_at']?></td>
                                <td><?= $data_betting['txn_id']?></td>
                                <td>NULL</td>
                            </tr>
                            <?php
                            }
                            ?>
                            
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>User Site</th>
                                <th>User API</th>
                                <th>Bet Money</th>
                                <th>Win Money</th>
                                <th>Game NAme</th>
                                <th>Date Bet</th>
                                <th>Session Game</th>
                                <th>Matrix Betting</th>
                            </tr>
                        </tfoot>
                    </table>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>

    </div>
</section><!-- /.content -->