<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Member Status</h3>                                    
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="table-member-list" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>User</th>
                                <th>Provider</th>
                                <th>Game</th>
                                <th>Bet</th>
                                <th>Balance</th>
                                <th>Target RTP</th>
                                <th>Real RTP</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $getUserOn = $GS->callPlayers();
                            file_put_contents('Z'.$operator.'-user.json', json_encode($getUserOn));
                            $json = json_decode(file_get_contents('Z'.$operator."-user.json"), true);
                            foreach($json['data'] as $key){
                                $username = $key['user_code'];
                                $cek_user = mysqli_query($call, "SELECT * FROM tb_user WHERE intUser = '$username' AND agent_code = '$operator'");
                                if(mysqli_num_rows($cek_user) == 1){
                                $data_player = mysqli_fetch_array($cek_user);
                                
                                $getUserOn1 = $GS->callList($key['provider_code'],$key['game_code'],$key['user_code']);
        						file_put_contents('Z'.$operator.'-list.json', json_encode($getUserOn1));
                                                                
                            ?>
                            <tr>
                                <td><?= $data_player['extUser']?></td>
                                <td><?= $key['provider_code']?></td>
                                <td><?= $key['game_code']?></td>
                                <td><?= $key['bet']?></td>
                                <td><?= $key['balance']?></td>
                                <td><?= $key['target_rtp']?></td>
                                <td><?= $key['real_rtp']?></td>
                                <td><button class="btn btn-primary" data-toggle="modal" data-target="#add-<?= $data_player['extUser']?>">Set RTP</button></td>
                            </tr>
                            
                            <div class="modal fade" id="add-<?= $data_player['extUser']?>" tabindex="-1" role="dialog" aria-labelledby="<?= $data_player['extUser']?>" aria-hidden="true">
							  	<div class="modal-dialog" role="document">
							    	<div class="modal-content">
							      		<div class="modal-header">
							        		<h5 class="modal-title" id="exampleModalLabel">Edit RTP <?= strtoupper($data_player['extUser']) ?></h5>
							        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          			<span aria-hidden="true">&times;</span>
							        		</button>
							      		</div>
								      	<div class="modal-body">
								        	<form method="POST">
								        	   
								        	    <div class="form-group">
						                            <label>User API</label>
						                            <input type="text" name="user_code" class="form-control" value="<?= $key['user_code']?>" readonly>
						                        </div>
						                        
						                        <div class="form-group">
						                            <label>User</label>
						                            <input type="text" name="user" class="form-control" value="<?= $data_player['extUser']?>" readonly>
						                        </div>
						                        
						                        <div class="form-group">
						                            <label>Bet</label>
						                            <input type="text" name="bet" class="form-control" value="<?= $key['bet']?>" readonly>
						                        </div>
						                        
						                        <div class="form-group">
						                            <label>Provider</label>
						                            <input type="text" name="provider_code" class="form-control" value="<?= $key['provider_code']?>" readonly>
						                        </div>
						                        
						                        <div class="form-group">
						                            <label>Game Code</label>
						                            <input type="text" name="game_code" class="form-control" value="<?= $key['game_code']?>" readonly>
						                        </div>
						                        
						                        <div class="form-group">
						                            <label>RTPReal</label>
						                            <input type="text" name="rtp" class="form-control" value="<?= $key['real_rtp']?>" readonly>
						                        </div>
						                        <div class="form-group">
						                            <div class="row">
						                                <div class="col-xs-6">
						                                    <label>Call List</label>
        						                            <select name="call_rtp" class="form-control">
        						                                <?php
        						                                $json1 = json_decode(file_get_contents('Z'.$operator."-list.json"), true);
        						                                foreach($json1['calls'] as $keys){
        						                                    $rtp = $key['bet']*($keys['rtp']/100);
        						                                ?>
        						                                <option value="<?= $keys['rtp']?>"><?= $keys['call_type']?> | Rp.<?= number_format($rtp)?></option>
        						                                <?php
        						                                }
        						                                ?>
        						                            </select>
						                                </div>
						                                <div class="col-xs-6">
						                                    <label>Call Type</label>
						                                    <select name="call_type" class="form-control">
        						                                <option value="1">Common</option>
        						                                <option value="2">Buy Spin</option>
        						                            </select>
						                                </div>
						                            </div>
						                        </div>
						                        <hr>
						                        <div class="form-group">
						                            <label></label>
						                            <input type="submit" name="set_rtp" class="btn btn-success"  value="Edit" style="width: 100%;">
						                        </div>
						                    </form>
								      	</div>
							
							    	</div>
							  	</div>
							</div>
                            
                            <?php
                                } else {
                                    ?>
                            
                                    <?php
                                }
                            }
                            ?>
                            
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>User</th>
                                <th>Provider</th>
                                <th>Game</th>
                                <th>Bet</th>
                                <th>Balance</th>
                                <th>Target RTP</th>
                                <th>Real RTP</th>
                                <th>Action</th>
                            </tr>
                        </tfoot>
                    </table>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>

    </div>
</section><!-- /.content -->