import { Handler } from 'aws-lambda';

const getSomethingHandler: Handler = async (event, context) => {

  console.log({
    event, context
  })

  return {
    statusCode: 200,
    body: JSON.stringify({ message: 'Function executed.' }),
  };
};

export { getSomethingHandler };
