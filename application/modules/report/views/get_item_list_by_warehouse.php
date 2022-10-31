<table class="table table-bordered table-hover" id="purchaseTable" style="font-size: 12px">
	<thead>
		<tr>
			<th class="text-center"><?php echo display('serial') ?></th>
			<th class="text-center" width="80%"><?php echo display('product_name') ?><i class="text-danger">*</i></th>
			<th class="text-center"><?php echo display('opening_quantity') ?> <i class="text-danger">*</i></th>
		</tr>
	</thead>
	<tbody>
		<?php
			if(sizeof($item_list))
				foreach($item_list as $key => $value) {
		?>	
			<tr>
				<td><?php echo $key+1; ?></td>
				<td><?php echo $value->product_name; ?><input type="hidden" name="product_id[]" value="<?php echo $value->product_id; ?>"></td>
				<td><input type="number" name="quantity[]" class="form-control" value="<?php echo $value->quantity; ?>"></td>
			</tr>
		<?php } ?>
	</tbody>
</table>