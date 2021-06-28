module gst.mpegts.DVBLinkageDescriptor;

private import glib.PtrArray;
private import gobject.ObjectG;
private import gst.mpegts.DVBLinkageEvent;
private import gst.mpegts.DVBLinkageMobileHandOver;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public class DVBLinkageDescriptor
{
	/** the main Gtk struct */
	protected GstMpegtsDVBLinkageDescriptor* gstMpegtsDVBLinkageDescriptor;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsDVBLinkageDescriptor* getDVBLinkageDescriptorStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsDVBLinkageDescriptor;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsDVBLinkageDescriptor;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsDVBLinkageDescriptor* gstMpegtsDVBLinkageDescriptor, bool ownedRef = false)
	{
		this.gstMpegtsDVBLinkageDescriptor = gstMpegtsDVBLinkageDescriptor;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			gst_mpegts_dvb_linkage_descriptor_free(gstMpegtsDVBLinkageDescriptor);
	}


	/** */
	public static GType getType()
	{
		return gst_mpegts_dvb_linkage_descriptor_get_type();
	}

	/** */
	public void free()
	{
		gst_mpegts_dvb_linkage_descriptor_free(gstMpegtsDVBLinkageDescriptor);
		ownedRef = false;
	}

	/**
	 * Returns: The #GstMpegtsDVBLinkageEvent or %NULL if an error happened
	 */
	public DVBLinkageEvent getEvent()
	{
		auto __p = gst_mpegts_dvb_linkage_descriptor_get_event(gstMpegtsDVBLinkageDescriptor);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DVBLinkageEvent)(cast(GstMpegtsDVBLinkageEvent*) __p);
	}

	/**
	 * Returns: an #GstMpegtsDVBLinkageExtendedEvent array or %NULL if an error happened
	 */
	public PtrArray getExtendedEvent()
	{
		auto __p = gst_mpegts_dvb_linkage_descriptor_get_extended_event(gstMpegtsDVBLinkageDescriptor);

		if(__p is null)
		{
			return null;
		}

		return new PtrArray(cast(GPtrArray*) __p);
	}

	/**
	 * Returns: The #GstMpegtsDVBLinkageMobileHandOver or %NULL if an error happened
	 */
	public DVBLinkageMobileHandOver getMobileHandOver()
	{
		auto __p = gst_mpegts_dvb_linkage_descriptor_get_mobile_hand_over(gstMpegtsDVBLinkageDescriptor);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DVBLinkageMobileHandOver)(cast(GstMpegtsDVBLinkageMobileHandOver*) __p);
	}
}
