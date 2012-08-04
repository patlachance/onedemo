#!/bin/sh

TOOLDIR="/s3fs/itisopen/awslab/demo"
CONFFILE="templates/hosts/create_ec2_hosts.conf"

echo -n "Creating EC2 hosts:"
cat $CONFFILE | grep -v ^# | while read line; do
    ec2dcname=`echo $line | cut -d: -f1`
    ec2region=`echo $line | cut -d: -f2`
    ec2regionname=`echo $line | cut -d: -f3`
    echo "  -> $ec2dcname"
    result=`onehost create ec2-$ec2dcname --im im_ec2 --vm vmm_ec2 --net dummy`
    #id=`echo $result | awk '{print $2}'`
    #echo $TOOLDIR/one_host_add_attr.sh $id EC2REGION $ec2region
    #$TOOLDIR/one_host_add_attr.sh $id EC2REGION $ec2region
    #$TOOLDIR/one_host_add_attr.sh $id EC2REGIONNAME "$ec2regionname"
done
