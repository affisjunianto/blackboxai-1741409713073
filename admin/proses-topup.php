<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Proses TopUp Agent</h3>                                    
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="table-member-list" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>TrxID</th>
                                <th>Agent Code</th>
                                <th>Amount</th>
                                <th>Coin</th>
                                <th>Status</th>
                                <th>Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $cek_status = mysqli_query($call, "SELECT * FROM tb_balance WHERE status = 'Pending'");
                            while($data_member = mysqli_fetch_array($cek_status)){
                            ?>
                            <tr>
                                <td><?= $data_member['trxid']?></td>
                                <td><?= $data_member['agent_code']?></td>
                                <td><?= number_format($data_member['amount'],0,',','.')?></td>
                                <td><?= number_format($data_member['balance'],0,',','.')?></td>
                                <td><?= strtoupper($data_member['status'])?></td>
                                <td><?= $data_member['created']?></td>
                                <td><button class="btn btn-primary" data-toggle="modal" data-target="#add-<?= $data_member['id']?>">Update</button></td>
                            </tr>
                            
                            <div class="modal fade" id="add-<?= $data_member['id']?>" tabindex="-1" role="dialog" aria-labelledby="<?= $data_perpanjang['id']?>" aria-hidden="true">
							  	<div class="modal-dialog" role="document">
							    	<div class="modal-content">
							      		<div class="modal-header">
							        		<h5 class="modal-title" id="exampleModalLabel">Proses <?= strtoupper($data_member['agent_code']) ?></h5>
							        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          			<span aria-hidden="true">&times;</span>
							        		</button>
							      		</div>
								      	<div class="modal-body">
								        	<form method="POST">
								        		<input type="hidden" name="id" value="<?= $data_member['id']?>">
						                        <div class="form-group">
						                            <label>Agent</label>
						                            <input type="text" name="agent" class="form-control" value="<?= $data_member['agent_code']?>" readonly>
						                        </div>
						                        <div class="form-group">
						                            <div class="row">
						                                <div class="col-xs-6">
						                                    <label>Action</label>
        						                            <select name="action" class="form-control">
        						                                <option value="Success">Success</option>
        						                                <option value="Cancel">Cancel</option>
        						                            </select>
						                                </div>
						                            </div>
						                        </div>
						                        <hr>
						                        <div class="form-group">
						                            <label></label>
						                            <input type="submit" name="proses" class="btn btn-success"  value="Edit" style="width: 100%;">
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
                                <th>TrxID</th>
                                <th>Agent Code</th>
                                <th>Amount</th>
                                <th>Coin</th>
                                <th>Status</th>
                                <th>Date</th>
                                <th>Action</th>
                            </tr>
                        </tfoot>
                    </table>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>

    </div>
</section><!-- /.content -->