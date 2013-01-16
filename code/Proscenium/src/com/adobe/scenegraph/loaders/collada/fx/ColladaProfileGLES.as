// ============================================================================
//
//  Copyright 2012 Adobe Systems
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
// ============================================================================
package com.adobe.scenegraph.loaders.collada.fx
{
	// ===========================================================================
	//	Imports
	// ---------------------------------------------------------------------------
	import com.adobe.scenegraph.loaders.collada.*;
	
	// ===========================================================================
	//	Class
	// ---------------------------------------------------------------------------
	public class ColladaProfileGLES extends ColladaProfile
	{
		// ======================================================================
		//	Constants
		// ----------------------------------------------------------------------
		public static const TAG:String								= "profile_GLES";
		
		// ======================================================================
		//	Properties
		// ----------------------------------------------------------------------
		;															// @id				xs:ID
		public var platform:String;									// @platform		xs:NCName
		;															// <asset>			0 or 1
		;															// <newparam>		0 or more
		public var techniques:Vector.<ColladaTechniqueFXShader>		// <technique>(FX)	1 or more
		;															// <extra>			0 or more
		
		// ======================================================================
		//	Getters and Setters
		// ----------------------------------------------------------------------
		override public function get tag():String { return TAG; };

		// ======================================================================
		//	Constructor
		// ----------------------------------------------------------------------
		public function ColladaProfileGLES( profile:XML )
		{
			super( profile );
			
			if ( platform )
				platform = profile.@platform;

			techniques	= ColladaTechniqueFXShader.parseTechniques( profile.technique );
		}

		// ======================================================================
		//	Methods
		// ----------------------------------------------------------------------
		override protected function fillXML( profile:XML ):void
		{
			if ( platform )
				profile.@platform = platform;
			
			for each ( var technique:ColladaTechniqueFXShader in techniques ) {
				profile.appendChild( technique.toXML() );
			}

			super.fillXML( profile );
		}
	}
}