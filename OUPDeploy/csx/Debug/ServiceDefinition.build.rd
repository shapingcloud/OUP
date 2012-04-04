<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="OUPDeploy" generation="1" functional="0" release="0" Id="4573eac1-4b6b-465a-98fe-edea2b398f8e" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="OUPDeployGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="OALDProto:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/OUPDeploy/OUPDeployGroup/LB:OALDProto:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="OALDProto:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/OUPDeploy/OUPDeployGroup/MapOALDProto:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="OALDProtoInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/OUPDeploy/OUPDeployGroup/MapOALDProtoInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:OALDProto:Endpoint1">
          <toPorts>
            <inPortMoniker name="/OUPDeploy/OUPDeployGroup/OALDProto/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapOALDProto:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/OUPDeploy/OUPDeployGroup/OALDProto/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapOALDProtoInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/OUPDeploy/OUPDeployGroup/OALDProtoInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="OALDProto" generation="1" functional="0" release="0" software="C:\dev\git\oald\OUPDeploy\csx\Debug\roles\OALDProto" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;OALDProto&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;OALDProto&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/OUPDeploy/OUPDeployGroup/OALDProtoInstances" />
            <sCSPolicyFaultDomainMoniker name="/OUPDeploy/OUPDeployGroup/OALDProtoFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyFaultDomain name="OALDProtoFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="OALDProtoInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="cbbd3d8f-0f68-4bae-b9b5-021a0f5d70f1" ref="Microsoft.RedDog.Contract\ServiceContract\OUPDeployContract@ServiceDefinition.build">
      <interfacereferences>
        <interfaceReference Id="6a3925b1-d9de-48c3-82ea-c38c74bfe0ad" ref="Microsoft.RedDog.Contract\Interface\OALDProto:Endpoint1@ServiceDefinition.build">
          <inPort>
            <inPortMoniker name="/OUPDeploy/OUPDeployGroup/OALDProto:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>