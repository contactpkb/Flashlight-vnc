/*

	Copyright (C) 2008 Marco Fucci

	This library is free software; you can redistribute it and/or
	modify it under the terms of the GNU Library General Public
	License as published by the Free Software Foundation; either
	version 2 of the License, or (at your option) any later version.
	
	This library is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	Library General Public License for more details.
	
	You should have received a copy of the GNU Library General Public
	License along with this library; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
	
	Contact : mfucci@gmail.com
	
*/

/*
	Support of copyRect encoding
*/

package com.wizhelp.flashlight.codec
{
	import com.wizhelp.flashlight.rfb.RFBReader;
	import com.wizhelp.flashlight.thread.DataHandler;
	import com.wizhelp.flashlight.vnc.VNCHandler;
	
	import flash.geom.Point;
	import flash.utils.IDataInput;
	
	public class CodecCopyRect extends DataHandler
	{
		public function CodecCopyRect(vnc:VNCHandler, rfbReader:RFBReader) {
			super(
				4,
				function(stream:IDataInput):void {
				    var copyRectSrcX:int = stream.readUnsignedShort();
				    var copyRectSrcY:int = stream.readUnsignedShort();
				    
				    vnc.handleCopyImage(
				    	new Point(copyRectSrcX, copyRectSrcY),
				    	rfbReader.updateRect);
				});
		}
	}
}