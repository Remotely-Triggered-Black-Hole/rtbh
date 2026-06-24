# Overview

The page documents which networks support RTBH filtering, and if so, how it is configured.

The aim is provide not only a reference for operators to see how other networks have configured RTBH, but also to use the data as input to a community effort to standardize RTBH configuration across networks. Implementation alignment across networks increases the effectiveness of RTBH filtering for all.

Please contribute to this repository by adding the details for networks you know about (or to submit corrections for existing entries), by:

- Raising a pull request to update [rtbh.csv](rtbh.csv)
- Or fill out the [Google Form](https://docs.google.com/forms/d/e/1FAIpQLScg2Bvr_14onOtZRdoK2SNd0kCHFtqsdw-elsO5miUAO-3zzg/viewform?usp=dialog) (this will ultimately updates the CSV file via an automated pull request)

The CSV file is the source of truth for the RTBH configuration table.

## RTBH Configuration by Network

See the [RTBH Table](rtbh.md) for the current state of RTBH configuration by network.

The markdown table is automatically generated from the CSV file.

There is also a JSON version of the data, [rtbh.json](rtbh.json), which is also generated automatically from the CSV file.

## Table Headers

The table headers are defined as follows:

- Network: The name of the network or Internet Exchange Point (IXP).
- ASN: The Autonomous System Number (ASN) which RTBH routes are advertised to (for IXPs this is the route server).
- Enabled by Default: Indicates whether the network has the feature enabled by default if you must explicitly enable it e.g. via a support ticket.
- V4 Min Length: The minimum IPv4 prefix length that will be accepted as RTBH routes.
- V4 Max Length: The maximum IPv4 prefix length that will be accepted as RTBH routes.
- V6 Min Length: The minimum IPv6 prefix length that will be accepted as RTBH routes.
- V6 Max Length: The maximum IPv6 prefix length that will be accepted as RTBH routes.
- IRR Validated: Indicates whether the network validates RTBH routes against Internet Routing Registry (IRR) derived prefix filters.
- ROA Validated: Indicates whether the network validates RTBH routes against Route Origin Authorizations.
- ROA Invalid Accepted: Indicates whether the network accepts a ROA invalid prefix (i.e., due to prefix length exceeding ROA maxLength) _because_ the RTBH community is present.
- ROA Covering Origin Validated: Indicates whether the network accepts a ROA invalid prefix (i.e., due to prefix length exceeding ROA maxLength) _because_ the RTBH community is present _and_ there exists a ROA for a covering prefix with the same origin ASN.
- ASPA Validated: Indicates whether the network validates RTBH routes against AS Path Authorizations.
- RTBH Community: Stores the community used by the network for indicating an RTBH route (e.g. RFC7999 65535:666 or a custom community). Some operators support other communities in addition to the RFC community or their custom community e.g., for blackholing in specific regions. That is not captured here, this field captures what their "global" or most widely reaching community is.
- Forwards RTBH Routes: Indicates whether the network forwards RTBH routes to their eBGP neighbors (upstreams/downstreams/peers).

Meaning of the values in the table:

- If a network doesn't support RTBH all columns are set to a dash `-`.
- Unknown values are set to a question mark `?`.
- If a network accepts ROA invalids due to the RTBH route exceeding maxLength then `Yes` is used in the `ROA Invalid Accepted` column.
  - If the network checks there is a ROA for a covering prefix from the same origin, `Yes` is used in the `ROA Covering Origin Validated` column.
  - Vice versa, if no covering prefix ROA check is made, `No` is used in the `ROA Covering Origin Validated` column if.
  - In either case the prefix is ROA invalid, this is to gauge how many networks are doing an extra check.

## References

- [RFC 7999 BLACKHOLE Community](https://www.ietf.org/rfc/rfc7999)
