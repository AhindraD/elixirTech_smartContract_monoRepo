import { useState } from "react";
import { getUserCount } from "../app/utils";

const UserCountButton = () => {
  const [userCount, setUserCount] = useState(null);

  const handleGetUserCount = () => {
    try {
      const count = getUserCount();
      setUserCount(count);
    } catch (err) {
      console.error(err);
    }
  };

  return (
    <div className="flex flex-col items-center px-8 rounded-md justify-center border max-w-md mx-auto pt-2 mt-8 border-black">
      <button
        onClick={handleGetUserCount}
        className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded text-center"
      >
        Get User Count
      </button>
      {userCount !== null && (
        <p className="mt-4 text-lg font-semibold text-black">
          User Count: {userCount}
        </p>
      )}
    </div>
  );
};

export default UserCountButton;
