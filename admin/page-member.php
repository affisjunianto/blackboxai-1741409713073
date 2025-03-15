<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Member Online</h3>                                    
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="table-member-list" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>User Site</th>
                                <th>User API</th>
                                <th>Password API</th>
                                <th>Balance</th>
                                <th>Created</th>
                                <th>Create With</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            while($data_member = mysqli_fetch_array($cek_member)){
                            ?>
                            <tr>
                                <td><?= $data_member['extUser']?></td>
                                <td><?= $data_member['intUser']?></td>
                                <td><?= $data_member['password']?></td>
                                <td><?= number_format($data_member['balance'],0,',','.')?></td>
                                <td><?= $data_member['created']?></td>
                                <td><?= $data_member['agent_code']?></td>
                            </tr>
                            <?php
                            }
                            ?>
                            
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>User Site</th>
                                <th>User API</th>
                                <th>Password API</th>
                                <th>Balance</th>
                                <th>Created</th>
                                <th>Create With</th>
                            </tr>
                        </tfoot>
                    </table>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>

    </div>
</section><!-- /.content -->