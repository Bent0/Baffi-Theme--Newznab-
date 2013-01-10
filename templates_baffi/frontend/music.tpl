<h2>Browse Music</h2>

<div class="well well-small">
<center>
<form class="form-inline" name="browseby" action="music" style="margin:0;">
		
		<i class="fa-icon-user fa-icon-large fa-midt"></i>
		<input class="input input-medium" id="musicartist" type="text" name="artist" value="{$artist}" placeholder="Artist" />
		
		<i class="fa-icon-music fa-icon-large fa-midt"></i>
		<input class="input input-medium" id="musictitle" type="text" name="title" value="{$title}" placeholder="Title" />
			
		<i class="fa-icon-inbox fa-icon-large fa-midt"></i>
			<select class="input input-small" id="genre" name="genre">
				<option class="grouping" value=""></option>
				{foreach from=$genres item=gen}
					<option {if $gen.ID == $genre}selected="selected"{/if} value="{$gen.ID}">{$gen.title|escape:"htmlall"}</option>
				{/foreach}
			</select>
		
		<i class="fa-icon-calendar fa-icon-large fa-midt"></i>
			<select class="input input-small" id="year" name="year">
				<option class="grouping" value=""></option>
				{foreach from=$years item=yr}
					<option {if $yr==$year}selected="selected"{/if} value="{$yr}">{$yr}</option>
				{/foreach}
			</select>
			
		<i class="fa-icon-flag fa-icon-large fa-midt"></i>
			<select class="input input-small" id="category" name="t">
			<option class="grouping" value="3000"></option>
				{foreach from=$catlist item=ct}
					<option {if $ct.ID==$category}selected="selected"{/if} value="{$ct.ID}">{$ct.title}</option>
				{/foreach}
			</select>
		
		<input class="btn btn-success" type="submit" value="Go" />
</form>
</center>
</div>

{$site->adbrowse}	

{if $results|@count > 0}

<div {if $section != ''}style="margin-bottom:-40px;"{else}style="margin-bottom:-20px;"{/if}>
	{$pager}
</div>

<form id="nzb_multi_operations_form" action="get">

View: <b>Covers</b> | <a href="{$smarty.const.WWW_TOP}/browse?t={$category}">List</a><br />

<div class="well well-small">
	<div class="nzb_multi_operations">
		With Selected:
		<div class="btn-group">
			<input type="button" class="nzb_multi_operations_download btn btn-small btn-success" value="Download NZBs" />
			<input type="button" class="nzb_multi_operations_cart btn btn-small btn-info" value="Add to Cart" />
			{if $sabintegrated}<input type="button" class="nzb_multi_operations_sab btn btn-small btn-primary" value="Send to SAB" />{/if}
		</div>
	</div>
</div>

<table style="width:100%;" class="data highlight icons table table-striped" id="coverstable">
	<tr>
		<th width="130"><input type="checkbox" class="nzb_check_all" /></th>
		<th>artist<br/>
			<a title="Sort Descending" href="{$orderbyartist_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbyartist_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
		<th>year<br/>
			<a title="Sort Descending" href="{$orderbyyear_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbyyear_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
		<th>genre<br/>
			<a title="Sort Descending" href="{$orderbygenre_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbygenre_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
		<th>posted<br/>
			<a title="Sort Descending" href="{$orderbyposted_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbyposted_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
		<th>size<br/>
			<a title="Sort Descending" href="{$orderbysize_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbysize_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
		<th>files<br/>
			<a title="Sort Descending" href="{$orderbyfiles_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbyfiles_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
		<th>stats<br/>
			<a title="Sort Descending" href="{$orderbystats_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbystats_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
	</tr>

	{foreach from=$results item=result}
		<tr class="{cycle values=",alt"}">
			<td class="mid">
				<div class="movcover">
				<a class="title" title="View details" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/{$result.searchname|escape:"seourl"}">
					<img class="shadow img-polaroid" src="{$smarty.const.WWW_TOP}/covers/music/{if $result.cover == 1}{$result.musicinfoID}.jpg{else}no-cover.jpg{/if}" width="120" border="0" alt="{$result.artist|escape:"htmlall"} - {$result.title|escape:"htmlall"}" />
				</a>
				<div class="movextra">
					{if $result.nfoID > 0}<a href="{$smarty.const.WWW_TOP}/nfo/{$result.guid}" title="View Nfo" class="rndbtn modal_nfo badge" rel="nfo">Nfo</a>{/if}
					{if $result.url != ""}<a class="rndbtn badge badge-amaz" target="_blank" href="{$site->dereferrer_link}{$result.url}" name="amazon{$result.musicinfoID}" title="View amazon page">Amazon</a>{/if}
					<a class="rndbtn badge" href="{$smarty.const.WWW_TOP}/browse?g={$result.group_name}" title="Browse releases in {$result.group_name|replace:"alt.binaries":"a.b"}">Grp</a>
				</div>
				</div>
			</td>
			
			<td colspan="7" class="left" id="guid{$result.guid}">
				<h4><a class="title" title="View details" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/{$result.searchname|escape:"seourl"}">{$result.artist|escape:"htmlall"} - {$result.title|escape:"htmlall"}</a> (<a class="title" title="{$result.year}" href="{$smarty.const.WWW_TOP}/music?year={$result.year}">{$result.year}</a>)</h4>
				
				{if $result.genre != ""}<b>Genre:</b> <a href="{$smarty.const.WWW_TOP}/music/?genre={$result.genreID}">{$result.genre|escape:"htmlall"}</a><br />{/if}
				{if $result.publisher != ""}<b>Publisher:</b> {$result.publisher|escape:"htmlall"}<br />{/if}
				{if $result.releasedate != ""}<b>Released:</b> {$result.releasedate|date_format}<br />{/if}
				{if $result.haspreview == 2 && $userdata.canpreview == 1}<b>Preview:</b> <a href="#" name="audio{$result.guid}" title="Listen to {$result.searchname|escape:"htmlall"}" class="audioprev rndbtn" rel="audio">Listen</a><audio id="audprev{$result.guid}" src="{$smarty.const.WWW_TOP}/covers/audio/{$result.guid}.mp3" preload="none"></audio>{/if}
				<br />
				
				<div class="movextra">
					<b>{$result.searchname|escape:"htmlall"}</b> <a class="rndbtn btn btn-mini btn-info" href="{$smarty.const.WWW_TOP}/music?artist={$result.artist|escape:"url"}" title="View similar nzbs">Similar</a>
					{if $isadmin}
					
					<a class="rndbtn btn btn-mini btn-warning" href="{$smarty.const.WWW_TOP}/admin/release-edit.php?id={$result.releaseID}&amp;from={$smarty.server.REQUEST_URI|escape:"url"}" title="Edit Release">Edit</a> 
					<a class="rndbtn confirm_action btn btn-mini btn-danger" href="{$smarty.const.WWW_TOP}/admin/release-delete.php?id={$result.releaseID}&amp;from={$smarty.server.REQUEST_URI|escape:"url"}" title="Delete Release">Delete</a>
					{/if}
					<br />
					<ul class="inline">
						<li width="50px"><b>Info:</b></li>
						<li width="100px">Posted {$result.postdate|timeago}</li>
						<li width="80px">{$result.size|fsize_format:"MB"}</li>
						<li width="50px"><a title="View file list" href="{$smarty.const.WWW_TOP}/filelist/{$result.guid}">{$result.totalpart}</a> <i class="fa-icon-file"></i></li>
						<li width="50px"><a title="View comments for {$result.searchname|escape:"htmlall"}" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/#comments">{$result.comments}</a> <i class="fa-icon-comments-alt"></i></li>
						<li width="50px">{$result.grabs} <i class="fa-icon-download-alt"></i></li>
					</ul>
					
					<div class="icon"><input type="checkbox" class="nzb_check" value="{$result.guid}" /></div>
					<div class="icon icon_nzb"><a title="Download Nzb" href="{$smarty.const.WWW_TOP}/getnzb/{$result.guid}/{$result.searchname|escape:"url"}"><img src="/views/images/icons/nzbup.png"></a></div>
					<div class="icon icon_cart" title="Add to Cart"><img src="/views/images/icons/cartup.png"></div>
					{if $sabintegrated}<div class="icon icon_sab" title="Send to my Sabnzbd"><img src="/views/images/icons/sabup.png"></div>{/if}
				</div>
			</td>
		</tr>
	{/foreach}
	
</table>
{if $results|@count > 10}
<div class="well well-small" style="margin-bottom:-9px;">
	<div class="nzb_multi_operations">
		With Selected:
		<div class="btn-group">
			<input type="button" class="nzb_multi_operations_download btn btn-small btn-success" value="Download NZBs" />
			<input type="button" class="nzb_multi_operations_cart btn btn-small btn-info" value="Add to Cart" />
			{if $sabintegrated}<input type="button" class="nzb_multi_operations_sab btn btn-small btn-primary" value="Send to SAB" />{/if}
		</div>
	</div>
</div>
{/if}
<div style="margin-top:-20px;">
	{$pager}
</div>

{/if}
