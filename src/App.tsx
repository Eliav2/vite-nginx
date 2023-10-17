import "./App.css";
import { useEffect, useState } from "react";

function App() {
  const [data, setData] = useState("");

  useEffect(() => {
    fetch("/api/data")
      .then((res) => res.json())
      .then((data) => setData(JSON.stringify(data)));
  });

  return (
    <div>
      data from /api/data:
      <div>{data}</div>
    </div>
  );
}

export default App;
