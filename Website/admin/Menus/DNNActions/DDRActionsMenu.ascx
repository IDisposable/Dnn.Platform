﻿<%@ Control Language="C#" AutoEventWireup="true" %>
<%@ Register TagPrefix="dnn" TagName="ACTIONS" src="~/DesktopModules/DDRMenu/Actions.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web.Deprecated" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<dnn:DnnJsInclude runat="server" FilePath="~/admin/menus/dnnactions/dnnactions.debug.js" />

<dnn:ACTIONS ID="actionMenu" MenuStyle="admin/Menus/DNNActions" runat="server" />
<dnn:DnnScriptBlock ID="confirmScript" runat="server">
	<script type="text/javascript">
	(function($) {
		$(document).ready(function() {
		    //Regular Confirm
			var confirmString = "confirm('<%= HttpUtility.JavaScriptStringEncode("DeleteModule.Confirm")%>')";
			$("a[href*=\"" + confirmString +"\"]").attr("href", function () {
				return $(this).attr("href").replace( /if\(.+?\)\{(.+?)\}/ , "$1");//remove its original confirm function
			}).dnnConfirm({
				text: '<%= HttpUtility.JavaScriptStringEncode("DeleteModule.Confirm", Localization.SharedResourceFile) %>',
				yesText: '<%= HttpUtility.JavaScriptStringEncode("Yes.Text", Localization.SharedResourceFile) %>',
				noText: '<%= HttpUtility.JavaScriptStringEncode("No.Text", Localization.SharedResourceFile) %>',
				title: '<%= HttpUtility.JavaScriptStringEncode("Confirm.Text", Localization.SharedResourceFile) %>'
			});

		    //Module Sharing Confirm
			confirmString = "confirm('<%= HttpUtility.JavaScriptStringEncode("DeleteSharedModule.Confirm")%>')";
			$("a[href*=\"" + confirmString +"\"]").attr("href", function () {
				return $(this).attr("href").replace( /if\(.+?\)\{(.+?)\}/ , "$1");//remove its original confirm function
			}).dnnConfirm({
				text: '<%= HttpUtility.JavaScriptStringEncode("DeleteSharedModule.Confirm", Localization.SharedResourceFile) %>',
				yesText: '<%= HttpUtility.JavaScriptStringEncode("Yes.Text", Localization.SharedResourceFile) %>',
				noText: '<%= HttpUtility.JavaScriptStringEncode("No.Text", Localization.SharedResourceFile) %>',
				title: '<%= HttpUtility.JavaScriptStringEncode("Confirm.Text", Localization.SharedResourceFile) %>'
			});
		});
	}(jQuery));
	</script>
</dnn:DnnScriptBlock>

<script runat="server">
	protected override void OnLoad(EventArgs e)
	{
		base.OnLoad(e);
        
		if(!Context.Items.Contains("ActionsMenuLoaded"))
		{
			Context.Items.Add("ActionsMenuLoaded", true);
		}
		else
		{
			confirmScript.Visible = false;
		}
		
		jQuery.RegisterDnnJQueryPlugins(Page);
	}
</script>