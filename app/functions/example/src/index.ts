import { Handler } from 'aws-lambda';

const handler: Handler = async (event, context) => {
  return {
    statusCode: 200,
    body: JSON.stringify({ message: 'Function 2 executed.' }),
  };
};

export { handler };
