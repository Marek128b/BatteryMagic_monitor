<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="16" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="14" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="6" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="pinhead" urn="urn:adsk.eagle:library:325">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="1X04" urn="urn:adsk.eagle:footprint:22258/1" library_version="5">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-5.1562" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
</package>
<package name="1X04/90" urn="urn:adsk.eagle:footprint:22259/1" library_version="5">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-5.08" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-5.715" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="6.985" y="-4.445" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
</package>
</packages>
<packages3d>
<package3d name="1X04" urn="urn:adsk.eagle:package:22407/2" type="model" library_version="5">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X04"/>
</packageinstances>
</package3d>
<package3d name="1X04/90" urn="urn:adsk.eagle:package:22404/2" type="model" library_version="5">
<description>PIN HEADER</description>
<packageinstances>
<packageinstance name="1X04/90"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="PINHD4" urn="urn:adsk.eagle:symbol:22257/1" library_version="5">
<wire x1="-6.35" y1="-5.08" x2="1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="7.62" x2="-6.35" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="8.255" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X4" urn="urn:adsk.eagle:component:22499/5" prefix="JP" uservalue="yes" library_version="5">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD4" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X04">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22407/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="91" constant="no"/>
</technology>
</technologies>
</device>
<device name="/90" package="1X04/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22404/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="9" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ADS7128">
<packages>
<package name="QFN50P300X300X80-17N">
<wire x1="1.5" y1="-1.5" x2="-1.5" y2="-1.5" width="0.127" layer="51"/>
<wire x1="1.5" y1="1.5" x2="-1.5" y2="1.5" width="0.127" layer="51"/>
<wire x1="1.5" y1="-1.5" x2="1.5" y2="1.5" width="0.127" layer="51"/>
<wire x1="-1.5" y1="-1.5" x2="-1.5" y2="1.5" width="0.127" layer="51"/>
<polygon width="0.01" layer="31">
<vertex x="-0.775" y="-0.725"/>
<vertex x="-0.775" y="0.725" curve="-90"/>
<vertex x="-0.725" y="0.775"/>
<vertex x="0.725" y="0.775" curve="-90"/>
<vertex x="0.775" y="0.725"/>
<vertex x="0.775" y="-0.725" curve="-90"/>
<vertex x="0.725" y="-0.775"/>
<vertex x="-0.725" y="-0.775" curve="-90"/>
</polygon>
<wire x1="-1.19" y1="-1.5" x2="-1.5" y2="-1.5" width="0.127" layer="21"/>
<wire x1="1.5" y1="-1.5" x2="1.19" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-1.19" y1="1.5" x2="-1.5" y2="1.5" width="0.127" layer="21"/>
<wire x1="1.5" y1="1.5" x2="1.19" y2="1.5" width="0.127" layer="21"/>
<wire x1="1.5" y1="1.19" x2="1.5" y2="1.5" width="0.127" layer="21"/>
<wire x1="1.5" y1="-1.5" x2="1.5" y2="-1.19" width="0.127" layer="21"/>
<wire x1="-1.5" y1="1.19" x2="-1.5" y2="1.5" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-1.5" x2="-1.5" y2="-1.19" width="0.127" layer="21"/>
<wire x1="-1.95" y1="1.95" x2="-1.95" y2="-1.95" width="0.05" layer="39"/>
<wire x1="-1.95" y1="-1.95" x2="1.95" y2="-1.95" width="0.05" layer="39"/>
<wire x1="1.95" y1="-1.95" x2="1.95" y2="1.95" width="0.05" layer="39"/>
<wire x1="1.95" y1="1.95" x2="-1.95" y2="1.95" width="0.05" layer="39"/>
<circle x="-2.4" y="0.75" radius="0.1" width="0.2" layer="21"/>
<circle x="-2.4" y="0.75" radius="0.1" width="0.2" layer="51"/>
<text x="-1.95" y="2.15" size="0.8128" layer="25">&gt;NAME</text>
<text x="-1.95" y="-2.15" size="0.8128" layer="27" align="top-left">&gt;VALUE</text>
<smd name="5" x="-0.75" y="-1.4" dx="0.24" dy="0.6" layer="1" roundness="43"/>
<smd name="6" x="-0.25" y="-1.4" dx="0.24" dy="0.6" layer="1" roundness="43"/>
<smd name="7" x="0.25" y="-1.4" dx="0.24" dy="0.6" layer="1" roundness="43"/>
<smd name="8" x="0.75" y="-1.4" dx="0.24" dy="0.6" layer="1" roundness="43"/>
<smd name="13" x="0.75" y="1.4" dx="0.24" dy="0.6" layer="1" roundness="43"/>
<smd name="14" x="0.25" y="1.4" dx="0.24" dy="0.6" layer="1" roundness="43"/>
<smd name="15" x="-0.25" y="1.4" dx="0.24" dy="0.6" layer="1" roundness="43"/>
<smd name="16" x="-0.75" y="1.4" dx="0.24" dy="0.6" layer="1" roundness="43"/>
<smd name="1" x="-1.4" y="0.75" dx="0.6" dy="0.24" layer="1" roundness="43"/>
<smd name="2" x="-1.4" y="0.25" dx="0.6" dy="0.24" layer="1" roundness="43"/>
<smd name="3" x="-1.4" y="-0.25" dx="0.6" dy="0.24" layer="1" roundness="43"/>
<smd name="4" x="-1.4" y="-0.75" dx="0.6" dy="0.24" layer="1" roundness="43"/>
<smd name="9" x="1.4" y="-0.75" dx="0.6" dy="0.24" layer="1" roundness="43"/>
<smd name="10" x="1.4" y="-0.25" dx="0.6" dy="0.24" layer="1" roundness="43"/>
<smd name="11" x="1.4" y="0.25" dx="0.6" dy="0.24" layer="1" roundness="43"/>
<smd name="12" x="1.4" y="0.75" dx="0.6" dy="0.24" layer="1" roundness="43"/>
<smd name="17" x="0" y="0" dx="1.68" dy="1.68" layer="1" roundness="5" cream="no"/>
</package>
</packages>
<symbols>
<symbol name="ADS7128">
<wire x1="0" y1="0" x2="0" y2="25.4" width="0.254" layer="94"/>
<wire x1="0" y1="25.4" x2="33.02" y2="25.4" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="33.02" y2="0" width="0.254" layer="94"/>
<wire x1="33.02" y1="0" x2="33.02" y2="25.4" width="0.254" layer="94"/>
<circle x="2.032" y="23.622" radius="1.27" width="0.254" layer="94"/>
<pin name="AIN2/GPIO2" x="-5.08" y="20.32" length="middle"/>
<pin name="AIN3/GPIO3" x="-5.08" y="17.78" length="middle"/>
<pin name="AIN4/GPIO4" x="-5.08" y="15.24" length="middle"/>
<pin name="AIN5/GPIO5" x="-5.08" y="12.7" length="middle"/>
<pin name="AIN6/GPIO6" x="-5.08" y="10.16" length="middle"/>
<pin name="AIN7/GPIO7" x="-5.08" y="7.62" length="middle"/>
<pin name="AVDD" x="-5.08" y="5.08" length="middle"/>
<pin name="DECAP" x="-5.08" y="2.54" length="middle"/>
<pin name="GND" x="38.1" y="2.54" length="middle" rot="R180"/>
<pin name="DVDD" x="38.1" y="5.08" length="middle" rot="R180"/>
<pin name="ADDR" x="38.1" y="7.62" length="middle" rot="R180"/>
<pin name="ALERT" x="38.1" y="10.16" length="middle" rot="R180"/>
<pin name="SCL" x="38.1" y="12.7" length="middle" rot="R180"/>
<pin name="SDA" x="38.1" y="15.24" length="middle" rot="R180"/>
<pin name="AIN0/GPIO0" x="38.1" y="17.78" length="middle" rot="R180"/>
<pin name="AIN1/GPIO1" x="38.1" y="20.32" length="middle" rot="R180"/>
<pin name="EP" x="38.1" y="22.86" length="middle" rot="R180"/>
<text x="11.43" y="22.86" size="1.778" layer="94">ADS7128</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="ADS7128">
<gates>
<gate name="G$1" symbol="ADS7128" x="-17.78" y="-12.7"/>
</gates>
<devices>
<device name="" package="QFN50P300X300X80-17N">
<connects>
<connect gate="G$1" pin="ADDR" pad="11"/>
<connect gate="G$1" pin="AIN0/GPIO0" pad="15"/>
<connect gate="G$1" pin="AIN1/GPIO1" pad="16"/>
<connect gate="G$1" pin="AIN2/GPIO2" pad="1"/>
<connect gate="G$1" pin="AIN3/GPIO3" pad="2"/>
<connect gate="G$1" pin="AIN4/GPIO4" pad="3"/>
<connect gate="G$1" pin="AIN5/GPIO5" pad="4"/>
<connect gate="G$1" pin="AIN6/GPIO6" pad="5"/>
<connect gate="G$1" pin="AIN7/GPIO7" pad="6"/>
<connect gate="G$1" pin="ALERT" pad="12"/>
<connect gate="G$1" pin="AVDD" pad="7"/>
<connect gate="G$1" pin="DECAP" pad="8"/>
<connect gate="G$1" pin="DVDD" pad="10"/>
<connect gate="G$1" pin="EP" pad="17"/>
<connect gate="G$1" pin="GND" pad="9"/>
<connect gate="G$1" pin="SCL" pad="13"/>
<connect gate="G$1" pin="SDA" pad="14"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="JP1" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X4" device="" package3d_urn="urn:adsk.eagle:package:22407/2"/>
<part name="JP2" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X4" device="" package3d_urn="urn:adsk.eagle:package:22407/2"/>
<part name="JP3" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X4" device="" package3d_urn="urn:adsk.eagle:package:22407/2"/>
<part name="JP4" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-1X4" device="" package3d_urn="urn:adsk.eagle:package:22407/2"/>
<part name="U$1" library="ADS7128" deviceset="ADS7128" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="JP1" gate="A" x="-15.24" y="27.94" smashed="yes" rot="MR0">
<attribute name="NAME" x="-8.89" y="36.195" size="1.778" layer="95" rot="MR0"/>
<attribute name="VALUE" x="-8.89" y="20.32" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="JP2" gate="A" x="-15.24" y="10.16" smashed="yes" rot="MR0">
<attribute name="NAME" x="-8.89" y="18.415" size="1.778" layer="95" rot="MR0"/>
<attribute name="VALUE" x="-8.89" y="2.54" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="JP3" gate="A" x="73.66" y="10.16" smashed="yes">
<attribute name="NAME" x="67.31" y="18.415" size="1.778" layer="95"/>
<attribute name="VALUE" x="67.31" y="2.54" size="1.778" layer="96"/>
</instance>
<instance part="JP4" gate="A" x="73.66" y="27.94" smashed="yes">
<attribute name="NAME" x="67.31" y="36.195" size="1.778" layer="95"/>
<attribute name="VALUE" x="67.31" y="20.32" size="1.778" layer="96"/>
</instance>
<instance part="U$1" gate="G$1" x="12.7" y="12.7" smashed="yes"/>
</instances>
<busses>
</busses>
<nets>
<net name="AIN2/IO2" class="0">
<segment>
<pinref part="JP1" gate="A" pin="1"/>
<pinref part="U$1" gate="G$1" pin="AIN2/GPIO2"/>
<wire x1="-12.7" y1="33.02" x2="7.62" y2="33.02" width="0.1524" layer="91"/>
<label x="-7.62" y="33.02" size="1.778" layer="95"/>
</segment>
</net>
<net name="AIN3/IO3" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="AIN3/GPIO3"/>
<pinref part="JP1" gate="A" pin="2"/>
<wire x1="7.62" y1="30.48" x2="-12.7" y2="30.48" width="0.1524" layer="91"/>
<label x="-7.62" y="30.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="AIN4/IO4" class="0">
<segment>
<pinref part="JP1" gate="A" pin="3"/>
<pinref part="U$1" gate="G$1" pin="AIN4/GPIO4"/>
<wire x1="-12.7" y1="27.94" x2="7.62" y2="27.94" width="0.1524" layer="91"/>
<label x="-7.62" y="27.94" size="1.778" layer="95"/>
</segment>
</net>
<net name="AIN5/IO5" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="AIN5/GPIO5"/>
<pinref part="JP1" gate="A" pin="4"/>
<wire x1="7.62" y1="25.4" x2="-12.7" y2="25.4" width="0.1524" layer="91"/>
<label x="-7.62" y="25.4" size="1.778" layer="95"/>
</segment>
</net>
<net name="AIN6/IO6" class="0">
<segment>
<pinref part="JP2" gate="A" pin="1"/>
<wire x1="-12.7" y1="15.24" x2="-12.7" y2="22.86" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="AIN6/GPIO6"/>
<wire x1="-12.7" y1="22.86" x2="7.62" y2="22.86" width="0.1524" layer="91"/>
<label x="-7.62" y="22.86" size="1.778" layer="95"/>
</segment>
</net>
<net name="AIN7/IO7" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="AIN7/GPIO7"/>
<wire x1="7.62" y1="20.32" x2="-10.16" y2="20.32" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="20.32" x2="-10.16" y2="12.7" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="2"/>
<wire x1="-10.16" y1="12.7" x2="-12.7" y2="12.7" width="0.1524" layer="91"/>
<label x="-7.62" y="20.32" size="1.778" layer="95"/>
</segment>
</net>
<net name="AVDD" class="0">
<segment>
<pinref part="JP2" gate="A" pin="3"/>
<wire x1="-12.7" y1="10.16" x2="-7.62" y2="10.16" width="0.1524" layer="91"/>
<wire x1="-7.62" y1="10.16" x2="-7.62" y2="17.78" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="AVDD"/>
<wire x1="-7.62" y1="17.78" x2="7.62" y2="17.78" width="0.1524" layer="91"/>
<label x="-5.08" y="17.78" size="1.778" layer="95"/>
</segment>
</net>
<net name="DECAP" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="DECAP"/>
<wire x1="7.62" y1="15.24" x2="-5.08" y2="15.24" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="15.24" x2="-5.08" y2="7.62" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="4"/>
<wire x1="-5.08" y1="7.62" x2="-12.7" y2="7.62" width="0.1524" layer="91"/>
<label x="-5.08" y="15.24" size="1.778" layer="95"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="GND"/>
<wire x1="50.8" y1="15.24" x2="55.88" y2="15.24" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="EP"/>
<wire x1="55.88" y1="15.24" x2="55.88" y2="35.56" width="0.1524" layer="91"/>
<wire x1="55.88" y1="35.56" x2="50.8" y2="35.56" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="4"/>
<wire x1="71.12" y1="7.62" x2="55.88" y2="7.62" width="0.1524" layer="91"/>
<wire x1="55.88" y1="7.62" x2="55.88" y2="15.24" width="0.1524" layer="91"/>
<junction x="55.88" y="15.24"/>
<label x="55.88" y="7.62" size="1.778" layer="95"/>
</segment>
</net>
<net name="AIN1/IO1" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="AIN1/GPIO1"/>
<wire x1="50.8" y1="33.02" x2="71.12" y2="33.02" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="1"/>
<label x="55.88" y="33.02" size="1.778" layer="95"/>
</segment>
</net>
<net name="AIN0/IO0" class="0">
<segment>
<pinref part="JP4" gate="A" pin="2"/>
<pinref part="U$1" gate="G$1" pin="AIN0/GPIO0"/>
<wire x1="71.12" y1="30.48" x2="50.8" y2="30.48" width="0.1524" layer="91"/>
<label x="58.42" y="30.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="SDA" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="SDA"/>
<pinref part="JP4" gate="A" pin="3"/>
<wire x1="50.8" y1="27.94" x2="71.12" y2="27.94" width="0.1524" layer="91"/>
<label x="60.96" y="27.94" size="1.778" layer="95"/>
</segment>
</net>
<net name="SCL" class="0">
<segment>
<pinref part="JP4" gate="A" pin="4"/>
<pinref part="U$1" gate="G$1" pin="SCL"/>
<wire x1="71.12" y1="25.4" x2="50.8" y2="25.4" width="0.1524" layer="91"/>
<label x="60.96" y="25.4" size="1.778" layer="95"/>
</segment>
</net>
<net name="ALERT" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="ALERT"/>
<wire x1="50.8" y1="22.86" x2="66.04" y2="22.86" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="1"/>
<wire x1="66.04" y1="22.86" x2="66.04" y2="15.24" width="0.1524" layer="91"/>
<wire x1="66.04" y1="15.24" x2="71.12" y2="15.24" width="0.1524" layer="91"/>
<label x="58.42" y="22.86" size="1.778" layer="95"/>
</segment>
</net>
<net name="ADDR" class="0">
<segment>
<pinref part="JP3" gate="A" pin="2"/>
<wire x1="71.12" y1="12.7" x2="63.5" y2="12.7" width="0.1524" layer="91"/>
<wire x1="63.5" y1="12.7" x2="63.5" y2="20.32" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="ADDR"/>
<wire x1="63.5" y1="20.32" x2="50.8" y2="20.32" width="0.1524" layer="91"/>
<label x="55.88" y="20.32" size="1.778" layer="95"/>
</segment>
</net>
<net name="DVDD" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="DVDD"/>
<wire x1="50.8" y1="17.78" x2="60.96" y2="17.78" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="3"/>
<wire x1="60.96" y1="17.78" x2="60.96" y2="10.16" width="0.1524" layer="91"/>
<wire x1="60.96" y1="10.16" x2="71.12" y2="10.16" width="0.1524" layer="91"/>
<label x="60.96" y="10.16" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
