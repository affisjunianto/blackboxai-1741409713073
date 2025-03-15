<section class="content">
    <div class="row">
        
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Management Token</h3>                                    
                </div><!-- /.box-header -->

                <div class="box-body table-responsive">
                    
                    <table id="table-whitelist" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Agent ID</th>
                                <th>Agent Code</th>
                                <th>Agen Name</th>
                                <th>Agent Created</th>
                                <th>Balance</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if($data_admin['agent_level'] == "agent"){
                                $cek_perpanjang = mysqli_query($call, "SELECT * FROM tb_agent WHERE agent_upline = '".$data_admin['agent_code']."' ORDER BY id DESC");
                            } else if($data_admin['agent_level'] == "admin"){
                                $cek_perpanjang = mysqli_query($call, "SELECT * FROM tb_agent ORDER BY id DESC");
                            }
                            while ($data_perpanjang = mysqli_fetch_array($cek_perpanjang)) {
                            ?>
                            <tr>
                                <td style="color: green"><?= $data_perpanjang['id']?></td>
                                <td style="color: green"><?= $data_perpanjang['agent_code']?></td>
                                <td style="color: green"><?= $data_perpanjang['agent_name']?></td>
                                <td style="color: green"><?= $data_perpanjang['agent_created']?></td>
                                <td style="color: green"><?= number_format($data_perpanjang['agent_balance'],0,',','.')?></td>
                                <td>
                                	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add-<?= $data_perpanjang['id']?>">Edit Balance</button>
                                </td>
                            </tr>

                            <div class="modal fade" id="add-<?= $data_perpanjang['id']?>" tabindex="-1" role="dialog" aria-labelledby="<?= $data_perpanjang['id']?>" aria-hidden="true">
							  	<div class="modal-dialog" role="document">
							    	<div class="modal-content">
							      		<div class="modal-header">
							        		<h5 class="modal-title" id="exampleModalLabel">Edit Balance Agent <?= strtoupper($data_perpanjang['agent_name']) ?></h5>
							        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          			<span aria-hidden="true">&times;</span>
							        		</button>
							      		</div>
								      	<div class="modal-body">
								        	<form method="POST">
								        		<input type="hidden" name="agent_code" value="<?= $data_perpanjang['agent_code']?>">
						                        <div class="form-group">
						                            <label>Your Agent</label>
						                            <input type="text" name="token" class="form-control" value="<?= $data_admin['agent_code']?>" readonly>
						                        </div>
						                        
						                        <div class="form-group">
						                            <label>Agent Code</label>
						                            <input type="text" name="agent" class="form-control" value="<?= $data_perpanjang['agent_code']?>" readonly>
						                        </div>
						                        <div class="form-group">
						                            <div class="row">
						                                <div class="col-xs-6">
						                                    <label>Action</label>
        						                            <select name="action" class="form-control">
        						                                <option value="12">Add Balance</option>
        						                                <option value="11">Mines Balance</option>
        						                            </select>
						                                </div>
						                                <div class="col-xs-6">
						                                    <label>Balance</label>
						                                    <input type="tel" name="balance" class="form-control" value="0">
						                                </div>
						                            </div>
						                        </div>
						                        <hr>
						                        <div class="form-group">
						                            <label></label>
						                            <input type="submit" name="edit_balance" class="btn btn-success"  value="Edit" style="width: 100%;">
						                        </div>
						                    </form>
								      	</div>
							
							    	</div>
							  	</div>
							</div>
                            <?php
                            }
                            ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Agent Code</th>
                                <th>Agen Name</th>
                                <th>Agent Created</th>
                                <th>Balance</th>
                                <th>Action</th>
                            </tr>
                        </tfoot>
                    </table>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>
</section><!-- /.content -->