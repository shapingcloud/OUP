<%@ Page language="C#" MasterPageFile="~masterurl/default.master" Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceHolderId="PlaceHolderAdditionalPageHead" runat="server">
    <SharePoint:ScriptLink name="sp.js" runat="server" OnDemand="true" LoadAfterUI="true" Localizable="false" />
    <link rel="Stylesheet" type="text/css" href="../Styles/App.css" />   
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="../Scripts/App.js"></script>
</asp:Content>

<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">
    <div id="oald-frame" width="100%">

    </div>

        <script type="text/javascript">   
        ExecuteOrDelayUntilScriptLoaded(getWebUserData, "sp.js");   
        var context = null;   
        var web = null;   
        var currentUser = null;   
        function getWebUserData() {   
            context = new SP.ClientContext.get_current();   
            web = context.get_web();   
            currentUser = web.get_currentUser();   
            currentUser.retrieve();   
            context.load(web);   
            context.executeQueryAsync(Function.createDelegate(this, this.onSuccessMethod), Function.createDelegate(this, this.onFailureMethod));   
        }   
        function onSuccessMethod(sender, args) {   
            var userObject = web.get_currentUser();
            $('#oald-username').text(userObject.get_title());
            $('#oald-frame').html('<iframe width="100%" height="500px" src="http://oald.cloudapp.net/?usr='.concat(userObject.get_title()).concat('"></iframe>'));
        }   
        function onFailureMethod(sender, args) {   
            //do nothing for now
        }   
    </script>
</asp:Content>
