import { Box, Flex, Stack, StackDivider, Text } from "@chakra-ui/react";
import React from "react";

interface txnDetails {
  amount: number;
  message: string;
  senderAddress: string;
  timestamp: number;
}

export default function TxnCard({ txn }: { txn: txnDetails[] }) {
  return (
    <>
      {txn.map((item, index) => (
        <Stack divider={<StackDivider />} key="" spacing="2">
          <Box>
            <Flex alignItems={"center"}>
              <Box>
                <Text fontSize={"md"}>From: {item.senderAddress}</Text>
              </Box>
            </Flex>
            <Box justifyContent={"end"} alignContent={"end"}>
              Amount {item.amount} 5ire
            </Box>
            <Text pt="2" fontSize="md" fontWeight={"bold"}>
              {item.message}
            </Text>
          </Box>
          <br></br>
        </Stack>
      ))}
    </>
  );
}
