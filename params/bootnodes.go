// Copyright 2015 The gee Authors
// This file is part of the gee library.
//
// The gee library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The gee library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the gee library. If not, see <http://www.gnu.org/licenses/>.

package params

// MainnetBootnodes are the enode URLs of the P2P bootstrap nodes running on
// the main gee network.
var MainnetBootnodes = []string{

	// tokyo
	"enode://955d95cc75687127a17c6bcb243ab25e1c2f223fd41dac5a9d3c76a0725fdd8c9409cb9cc36cf8410aec48d213417bf33c48bfe4e432d431c5606a576e95810f@121.40.251.180:30310",
	"enode://5fbf50530e5cf19e45d09a942d717ed9709dfe6a6a4643628b0671247d121f6524c60a03c4282dd02639bd7e92e4ec63fb5e96a676669595c848adbce40a438d@112.74.35.220:30310",
	"enode://ea8d2042a420a5d706b7d19ebd6d838bc5a3fd07dc887bf496147ff3c528ee2df8844cb3565642f4aa94a1ab8f14389a735eb6a6690d90ecf76023786afd7404@119.23.221.27:30310",
	"enode://1a7da5b129e4150ae7be63123104cc3cda07ccfb5ee51aa998fea0337b19fbe4d27ff941559e2f2205a5e356df6c1a01a508b4067d8e40802e955237baeeeffd@161.117.86.219:30310",
	"enode://49a11e6992100e68edab21379127c5ef1d21ff62ad60067ac120a1863f98892ea48dc7d438793d79e403e2f96a364b9998dd7cbdae45859bbd03bfd4574b13ce@47.52.44.175:30310",
}

// TestnetBootnodes are the enode URLs of the P2P bootstrap nodes running on the
// GEE test network.
var TestnetBootnodes = []string{}

// SidechainBootnodes are the enode URLs of the P2P bootstrap nodes running on the
// GEE sidechain network.
var SidechainBootnodes = []string{
	// todo : the enode below is the test address local

	// todo: follow enode is the test side chain for testnet
	/*
		"enode://26ded0f3a4b67e8abdf1ca1260679d89f3241fb55397d08d13bdfd722986d49800a65285a9c370c29885d4db4680e0f17fae7b5ed8c097fa646dda04f9352f55@47.111.176.198:30311",
		"enode://41649ef8478431ec8698fc32b013944712c165c5d35079e53125b11318b2b0be4ae283c508ad8dd8f47d0a1ef93c43689c76723d9c04e002c6a67088109d3c98@47.111.176.198:30312",
		"enode://8e148790b14f67263f15fbecb98418967c4947d711c07ce3a1551f631b9b62de180eab9415303646affadc8970770a0170ae04073fbcb716ae272b09b7548ab6@47.111.176.198:30313",
		"enode://a3c786db06f05ed6a9bf6c0f04dad8945ae92f8f14927ba1cb23f08bb1ddaa710ba51aed8a4415bb86f6f58c3d273e631687bd721037ba4168a09906ab0cd38d@47.111.176.198:30314",

		"enode://dbb16f21052b8155cd3db2f58ab68476ceb12f70a4171965a535bbad420dc0f0708fc05d56ee510c8b8d944350391a26cc6ffc18b9174e9825d52c3f25a22f89@118.31.225.101:30315",
		"enode://68f345f4f265285b71deb98bd0b10c864165cdc37f7fc0f701222901d2f1fbf96b38387ce57b8dc90670100c281ad89463a17177db843bdf96f4868e5a5fb108@118.31.225.101:30316",
		"enode://56980ddfde8ef34d33be317a3a49dfdcb56dfcdefab769cbedb39301fd7e61c8ff63e1c9121d6d91c59493c3f9773e187c98953071795c1ddf54437941bc5a4e@118.31.225.101:30317",
		"enode://824213d5cf4e9b872185a4f1f599538c3e848147ce200b39504ea0b13fa5e9edc66a5fed0271f8cb88e281e34aacb5669ea4d8d64fc5b12df400bca43400e800@118.31.225.101:30318",
	*/
}

// RinkebyBootnodes are the enode URLs of the P2P bootstrap nodes running on the
// Rinkeby test network.
var RinkebyBootnodes = []string{}

// DiscoveryV5Bootnodes are the enode URLs of the P2P bootstrap nodes for the
// experimental RLPx v5 topic-discovery network.
var DiscoveryV5Bootnodes = []string{}
