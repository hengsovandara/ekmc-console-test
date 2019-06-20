SET xmloption = content;
CREATE TABLE public."Merchant" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text,
    description text,
    "openingHours" jsonb,
    "facebookUrl" text,
    "websiteUrl" text,
    "addressName" text,
    latitude text,
    longtitude text,
    "hideAddress" boolean DEFAULT false,
    "createdAt" timestamp with time zone DEFAULT now(),
    status text DEFAULT '0'::text,
    "logoUrl" text,
    "coverUrl" text,
    sector text,
    type text,
    size text,
    source text DEFAULT 'merchant'::text,
    "referenceId" uuid,
    flag text
);
CREATE TABLE public."Activity" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    note text,
    date text,
    type text DEFAULT 'note'::text,
    "createdAt" timestamp with time zone DEFAULT now(),
    "time" text,
    data jsonb,
    "ownerId" uuid,
    notify boolean DEFAULT true NOT NULL,
    "merchantId" uuid,
    "consumerId" uuid
);
CREATE TABLE public."Business" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text,
    documents jsonb
);
CREATE TABLE public."Commune" (
    "Id" uuid NOT NULL,
    "Name" text,
    "Description" text,
    "CreatedById" text,
    "Created" timestamp without time zone NOT NULL,
    "Updated" timestamp without time zone,
    "UpdatedById" text,
    "Inactive" boolean NOT NULL,
    "Version" bytea,
    "DistrictId" uuid NOT NULL
);
CREATE TABLE public."ContactDetail" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "phoneNumber" numeric,
    description text,
    "merchantId" uuid NOT NULL
);
CREATE TABLE public."Credential" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "phoneNumber" text NOT NULL,
    pin text,
    "userId" uuid NOT NULL
);
CREATE TABLE public."District" (
    "Id" uuid NOT NULL,
    "Name" text,
    "Description" text,
    "CreatedById" text,
    "Created" timestamp without time zone NOT NULL,
    "Updated" timestamp without time zone,
    "UpdatedById" text,
    "Inactive" boolean NOT NULL,
    "Version" bytea,
    "ProvinceId" uuid NOT NULL
);
CREATE TABLE public."Document" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "isChecked" boolean DEFAULT false NOT NULL,
    "isValid" boolean DEFAULT false NOT NULL,
    name text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now(),
    "updatedAt" timestamp with time zone DEFAULT now(),
    "merchantId" uuid,
    url text
);
CREATE TABLE public."DocumentType" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text,
    url text,
    "creatdedAt" timestamp with time zone DEFAULT now()
);
CREATE TABLE public."Province" (
    "Id" uuid NOT NULL,
    "Name" text,
    "Description" text,
    "CreatedById" text,
    "Created" timestamp without time zone NOT NULL,
    "Updated" timestamp without time zone,
    "UpdatedById" text,
    "Inactive" boolean NOT NULL,
    "Version" bytea
);
CREATE TABLE public."Roles" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    role text NOT NULL
);
CREATE TABLE public."Sector" (
    "Id" uuid NOT NULL,
    "Name" text,
    "Description" text,
    "CreatedById" text,
    "Created" timestamp without time zone NOT NULL,
    "Updated" timestamp without time zone,
    "UpdatedById" text,
    "Inactive" boolean NOT NULL,
    "Version" bytea
);
CREATE TABLE public."Session" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    token uuid,
    "credentialId" uuid
);
CREATE TABLE public."Users" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    role text NOT NULL,
    token uuid DEFAULT public.gen_random_uuid(),
    "phoneNumber" text,
    pin text,
    photo text
);
CREATE TABLE public."Village" (
    "Id" uuid NOT NULL,
    "Name" text,
    "Description" text,
    "CreatedById" text,
    "Created" timestamp without time zone NOT NULL,
    "Updated" timestamp without time zone,
    "UpdatedById" text,
    "Inactive" boolean NOT NULL,
    "Version" bytea,
    "CommuneId" uuid NOT NULL
);
CREATE TABLE public.ocr (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    "identityDocumentType" text,
    "tamperingDigital" numeric,
    "tamperingPhysical" numeric,
    gender text,
    "lastName" text,
    "firstName" text,
    "dateOfBirth" date,
    "documentExpiredDate" date,
    "documentNumber" text,
    city text,
    nationality text,
    "createdAt" date DEFAULT now(),
    "amazonS3IdDocument" text
);
CREATE TABLE public.t_account (
    "Id" uuid NOT NULL,
    "ReferenceId" uuid,
    "Status" integer,
    "Login" character varying(50),
    "FirstName" character varying(50),
    "LastName" character varying(50),
    "FullName" character varying(50),
    "Gender" character(1),
    "DateOfBirth" timestamp with time zone,
    "Nationality" character varying(50),
    "ScanDocument" jsonb,
    "VerifyFaceResult" jsonb,
    "LivenessResult" jsonb,
    "AmazonS3IdDocument" character varying(1024),
    "DocumentNumber" character varying(50),
    "DocumentExpiredDate" timestamp with time zone,
    "Citizenship" character varying(50),
    "IdentityDocumentType" character varying(10),
    "Address" character varying(1024),
    "IsScanPhoto" boolean,
    "Liveness" double precision,
    "IdTypeMatch" boolean,
    "FaceMatchPercentage" double precision,
    "IsFaceMatch" boolean,
    "AmazonS3FaceImage" text,
    "IsLiveVDO" boolean,
    "CreatedDate" timestamp without time zone DEFAULT now(),
    "UpdatedDate" timestamp without time zone,
    "Source" character varying(30),
    "Email" character varying(100),
    "SelectedIdType" character varying(100),
    "SelectedCountry" character varying(100),
    "IsEkycDataAccurate" boolean,
    "SlashAudit" jsonb,
    "Note" character varying(100),
    "TamperingPhysical" double precision,
    "TamperingDigital" double precision,
    "Commune" character varying(100),
    "District" character varying(100),
    "City" character varying(100),
    "AmazonS3FaceVideo" text,
    "Latitude" numeric,
    "Longitude" numeric,
    "HouseNumber" text,
    "Street" text,
    "PostalCode" text,
    "PlaceOfBirth" text,
    "CountryCode" text,
    "DocumentIssueDate" date
);
CREATE TABLE public.test_dara (
    id integer NOT NULL,
    name text NOT NULL
);
CREATE TABLE public.test_oudam (
    id integer NOT NULL,
    name text NOT NULL
);
CREATE TABLE public.test_oudam_oudam (
    id integer NOT NULL,
    name text NOT NULL
);
CREATE TABLE public.test_oudam_test (
    id integer NOT NULL,
    name text NOT NULL
);
ALTER TABLE ONLY public."Activity"
    ADD CONSTRAINT "Activity_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Business"
    ADD CONSTRAINT "Businesses_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."ContactDetail"
    ADD CONSTRAINT "ContactDetail_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Credential"
    ADD CONSTRAINT "Credential_phoneNumber_key" UNIQUE ("phoneNumber");
ALTER TABLE ONLY public."Credential"
    ADD CONSTRAINT "Credential_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Credential"
    ADD CONSTRAINT "Credential_userId_key" UNIQUE ("userId");
ALTER TABLE ONLY public."Document"
    ADD CONSTRAINT "Document_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."DocumentType"
    ADD CONSTRAINT "Documents_name_key" UNIQUE (name);
ALTER TABLE ONLY public."DocumentType"
    ADD CONSTRAINT "Documents_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Merchant"
    ADD CONSTRAINT "Merchant_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Merchant"
    ADD CONSTRAINT "Merchant_referenceId_key" UNIQUE ("referenceId");
ALTER TABLE ONLY public."Province"
    ADD CONSTRAINT "Provinces_Id_key" UNIQUE ("Id");
ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_role_key" UNIQUE (role);
ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_phoneNumber_key" UNIQUE ("phoneNumber");
ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_token_key" UNIQUE (token);
ALTER TABLE ONLY public.ocr
    ADD CONSTRAINT ocr_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.t_account
    ADD CONSTRAINT t_account_pkey PRIMARY KEY ("Id");
ALTER TABLE ONLY public.test_dara
    ADD CONSTRAINT test_dara_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.test_oudam_oudam
    ADD CONSTRAINT test_oudam_oudam_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.test_oudam
    ADD CONSTRAINT test_oudam_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.test_oudam_test
    ADD CONSTRAINT test_oudam_test_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.t_account
    ADD CONSTRAINT "uq_Id" UNIQUE ("Id");
ALTER TABLE ONLY public."Activity"
    ADD CONSTRAINT "Activity_consumerId_fkey" FOREIGN KEY ("consumerId") REFERENCES public.t_account("Id") ON UPDATE SET NULL ON DELETE SET NULL;
ALTER TABLE ONLY public."Activity"
    ADD CONSTRAINT "Activity_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE SET NULL ON DELETE SET NULL;
ALTER TABLE ONLY public."Activity"
    ADD CONSTRAINT "Activity_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES public."Users"(id) ON UPDATE SET NULL ON DELETE SET NULL;
ALTER TABLE ONLY public."ContactDetail"
    ADD CONSTRAINT "ContactDetail_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public."Credential"
    ADD CONSTRAINT "Credential_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."Users"(id) ON UPDATE SET NULL ON DELETE SET NULL;
ALTER TABLE ONLY public."District"
    ADD CONSTRAINT "Districts_ProvinceId_fkey" FOREIGN KEY ("ProvinceId") REFERENCES public."Province"("Id");
ALTER TABLE ONLY public."Document"
    ADD CONSTRAINT "Document_documentType_fkey" FOREIGN KEY (name) REFERENCES public."DocumentType"(name);
ALTER TABLE ONLY public."Document"
    ADD CONSTRAINT "Document_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_credentialId_fkey" FOREIGN KEY ("credentialId") REFERENCES public."Credential"(id) ON UPDATE SET NULL ON DELETE SET NULL;
ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_role_fkey" FOREIGN KEY (role) REFERENCES public."Roles"(role);
