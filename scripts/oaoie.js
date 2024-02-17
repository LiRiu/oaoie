/// import libraries
const { Web3 } = require("web3");
require("dotenv").config();

/// constant
const web3 = new Web3(
  "https://eth-sepolia.g.alchemy.com/v2/w5UW0l77G8aypPRImjF0lzmCY1ABL1fn"
);
const PRIVKEY = process.env.PRIVATE_KEY;
const SENDER = web3.eth.accounts.privateKeyToAccount(PRIVKEY);
const OAOIE_ABI = [
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        internalType: "uint256",
        name: "modelId",
        type: "uint256",
      },
      {
        indexed: false,
        internalType: "bytes",
        name: "input",
        type: "bytes",
      },
      {
        indexed: false,
        internalType: "bytes",
        name: "output",
        type: "bytes",
      },
      {
        indexed: false,
        internalType: "bytes32",
        name: "action",
        type: "bytes32",
      },
      {
        indexed: false,
        internalType: "string",
        name: "p0",
        type: "string",
      },
      {
        indexed: false,
        internalType: "string",
        name: "p1",
        type: "string",
      },
      {
        indexed: false,
        internalType: "string",
        name: "p2",
        type: "string",
      },
    ],
    name: "CallbackOperationResult",
    type: "event",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "modelId",
        type: "uint256",
      },
      {
        internalType: "bytes",
        name: "input",
        type: "bytes",
      },
      {
        internalType: "bytes",
        name: "output",
        type: "bytes",
      },
    ],
    name: "OAOCallback",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "string",
        name: "prompt",
        type: "string",
      },
    ],
    name: "calculateAIResult",
    outputs: [],
    stateMutability: "payable",
    type: "function",
  },
];
const OAOIE_ADDRESS = "0x5aC99f4C93A4fB87a8FB2Cbf4670C694D2B2CD96";
const OAOIE = new web3.eth.Contract(OAOIE_ABI, OAOIE_ADDRESS);

/// functions

async function calculateAIResult(_prompt, _value) {
  const data = await OAOIE.methods.calculateAIResult(_prompt).encodeABI();

  const tx = await web3.eth.accounts.signTransaction(
    {
      to: OAOIE_ADDRESS,
      value: _value,
      maxPriorityFeePerGas: 300000000,
      maxFeePerGas: 300000000,
      data: data,
      nonce: await web3.eth.getTransactionCount(SENDER.address),
    },
    SENDER.privateKey
  );

  const receipt = await web3.eth.sendSignedTransaction(tx.rawTransaction);
  console.log(receipt);
}

async function main() {
  const paramsPrompt = process.argv[2];
  const prompt = `"I want to send ben 10 btc token" → "send ben 10 bitcoin" "I want to swap 20 eth for 10 btc" → "swap 20 eth for 10 btc" "${paramsPrompt}" → ? only reply the answer in 5 words!`
  
  console.log("[+] start calculating AI result...");
  await calculateAIResult(prompt, web3.utils.toWei("1", "ether"));
}

/// main
main();
