export const fieldTypes: Record<
  string,
  Record<string, "string" | "number" | "boolean" | "date">
> = {
  user: {
    id: "number",
    firstname: "string",
    lastname: "string",
    email: "string",
    password: "string",
    refreshToken: "string",
    isActive: "boolean",
    createdAt: "date",
    updatedAt: "date"
  },

  city: {
    id: "number",
    zipcode: "number",
    name: "string",
    createdAt: "date",
    updatedAt: "date"
  },

  estateType: {
    id: "number",
    name: "string"
  },

  energyLabel: {
    id: "number",
    name: "string"
  },

  estate: {
    id: "number",
    address: "string",
    price: "number",
    payout: "number",
    gross: "number",
    net: "number",
    cost: "number",
    numRooms: "number",
    numFloors: "number",
    floorSpace: "number",
    groundSpace: "number",
    basementSpace: "number",
    yearConstruction: "number",
    yearRebuilt: "number",
    description: "string",
    floorplan: "string",
    numClicks: "number",
    cityId: "number",
    typeId: "number",
    staffId: "number",
    energyLabelId: "number",
    createdAt: "date",
    updatedAt: "date"
  },

  image: {
    id: "number",
    filename: "string",
    author: "string",
    description: "string",
    createdAt: "date",
    updatedAt: "date"
  },

  estateImageRel: {
    id: "number",
    estateId: "number",
    imageId: "number",
    isMain: "boolean",
    createdAt: "date",
    updatedAt: "date"
  },

  review: {
    id: "number",
    subject: "string",
    comment: "string",
    numStars: "number",
    estateId: "number",
    date: "date",
    userId: "number",
    isActive: "boolean",
    createdAt: "date",
    updatedAt: "date"
  },

  favorite: {
    id: "number",
    estateId: "number",
    userId: "number",
    createdAt: "date",
    updatedAt: "date"
  },

  staff: {
    id: "number",
    firstname: "string",
    lastname: "string",
    position: "string",
    image: "string",
    phone: "string",
    email: "string",
    createdAt: "date",
    updatedAt: "date"
  },
};